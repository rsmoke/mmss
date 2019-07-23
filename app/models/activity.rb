class Activity < ApplicationRecord
  belongs_to :session

  monetize :cost_in_cents

  validates :description, presence: true
  validates :date_occurs, presence: true, format: { with: ConstantData::VALID_DATE_REGEX }
  validates :cost_in_cents, presence: true, numericality: { only_integer: true }
end
