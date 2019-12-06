class FinancialAid < ApplicationRecord
  belongs_to :enrollment

  has_one_attached :taxform
end
