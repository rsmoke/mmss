# == Schema Information
#
# Table name: financial_aids
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  amount_cents  :integer
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

  private

  def send_status_watch_email
    if self.status == 'awarded'
      FinaidMailer.fin_aid_awarded_email(self).deliver_now
    end
    if self.status == 'rejected'
      FinaidMailer.fin_aid_rejected_email(self).deliver_now
    end
  end

end
