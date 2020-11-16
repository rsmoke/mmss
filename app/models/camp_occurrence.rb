# == Schema Information
#
# Table name: camp_occurrences
#
#  id                    :bigint           not null, primary key
#  camp_configuration_id :bigint           not null
#  description           :string           not null
#  begin_date            :date             not null
#  end_date              :date             not null
#  active                :boolean          default(FALSE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  cost_cents            :integer
#
class CampOccurrence < ApplicationRecord
  belongs_to :camp_configuration
  has_many :activities, dependent: :destroy
  has_many :courses, dependent: :destroy

  has_many :session_activities
  has_many :enrollments, through: :session_activities

  has_many :session_assignments, dependent: :destroy

  validates :description, presence: true
  validates :begin_date, presence: true, format: { with: ConstantData::VALID_DATE_REGEX }
  validates :end_date, presence: true, format: { with: ConstantData::VALID_DATE_REGEX }
  validates :cost_cents, presence: true, numericality: { only_integer: true }

  monetize :cost_cents

  scope :active, -> { where(active: true).order(description: :asc) }

  scope :session_description, ->(description="") { where(description: description).active.first}

  def description_with_date
    if description == "Any Session"
      "#{description}"
    else
      "#{description} -- #{begin_date} until #{end_date}"
    end
  end

  def display_name
    "#{self.description} - #{self.begin_date} to #{self.end_date}" # or whatever column you want
  end

end
