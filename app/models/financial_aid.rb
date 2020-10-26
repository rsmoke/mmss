# == Schema Information
#
# Table name: financial_aids
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  amount_cents  :integer
#  source        :string
#  awarded       :boolean          default(FALSE)
#  note          :text
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class FinancialAid < ApplicationRecord
  belongs_to :enrollment

  has_one_attached :taxform
end
