class Session < ApplicationRecord
  belongs_to :camp_configuration
  has_many :activities, dependent: :destroy

  validates :description, presence: true
  validates :begin_date, presence: true, format: { with: ConstantData::VALID_DATE_REGEX }
  validates :end_date, presence: true, format: { with: ConstantData::VALID_DATE_REGEX }
  
  
  
  
end
