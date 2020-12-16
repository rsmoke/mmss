# == Schema Information
#
# Table name: financial_aids
#
#  id                :bigint           not null, primary key
#  enrollment_id     :bigint           not null
#  amount_cents      :integer          default(0)
#  source            :string
#  note              :text
#  status            :string           default("pending")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  payments_deadline :date
#
class FinancialAid < ApplicationRecord

  after_save :send_status_watch_email

  belongs_to :enrollment

  has_one_attached :taxform

  monetize :amount_cents

  validates :note, presence: :true
  validate :acceptable_taxform
  validate :set_deadline

  private

  def acceptable_taxform
    return unless taxform.attached?

    unless taxform.blob.byte_size <= 5.megabyte
      errors.add(:taxform, "is too big - file size cannot exceed 5Mbyte")
    end

    acceptable_types = ["image/png", "image/jpeg", "application/pdf"]
    unless acceptable_types.include?(taxform.content_type)
      errors.add(:taxform, "must be file type PDF, JPEG or PNG")
    end
  end

  def send_status_watch_email
    if self.status == 'awarded'
      FinaidMailer.fin_aid_awarded_email(self).deliver_now
    end
    if self.status == 'rejected'
      FinaidMailer.fin_aid_rejected_email(self).deliver_now
    end
  end

  def set_deadline
    return if self.status == 'pending'
    
    if self.payments_deadline.blank? || self.amount_cents <= 0
      errors.add(:payments_deadline, "you need to set a date")
    end

    if self.amount_cents <= 0
      errors.add(:amount_cents, "you need to set an amount")
    end
  end
    

end
