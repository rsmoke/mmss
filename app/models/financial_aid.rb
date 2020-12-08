# == Schema Information
#
# Table name: financial_aids
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  amount_cents  :integer          default(0)
#  source        :string
#  note          :text
#  status        :string           default("pending")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class FinancialAid < ApplicationRecord

  after_save :send_status_watch_email

  belongs_to :enrollment

  has_one_attached :taxform

  monetize :amount_cents

  validate :acceptable_taxform

  private

  def acceptable_taxform
    return unless taxform.attached?

    unless taxform.blob.byte_size <= 20.megabyte
      errors.add(:taxform, "is too big - file size cannot exceed 20Mbyte")
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

end
