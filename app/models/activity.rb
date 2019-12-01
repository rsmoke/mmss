class Activity < ApplicationRecord
  belongs_to :camp_occurrence
  has_many :enrollment_activities
  has_many :enrolled_users, through: :enrollment_activities, source: :enrollment

  monetize :cost_cents

  validates :description, presence: true
  validates :date_occurs, presence: true, format: { with: ConstantData::VALID_DATE_REGEX }
  validates :cost_cents, presence: true, numericality: { only_integer: true }

  def description_with_cost
    "#{description} -- #{cost_cents}"
  end

  scope :active, -> { where(active: true) }
end
