class Enrollment < ApplicationRecord
  belongs_to :user
  has_one :applicant_detail, through: :user

  has_many :enrollment_activities, dependent: :destroy
  has_many :registration_activities, through: :enrollment_activities, source: :activity

  has_many :session_activities, dependent: :destroy
  has_many :session_registrations, through: :session_activities, source: :camp_occurrence

  has_many :course_preferences, dependent: :destroy
  has_many :courses, through: :course_preferences

  has_one :financial_aid, dependent: :destroy
  has_many :travels, dependent: :destroy
  has_one :recommendation, dependent: :destroy

  # accepts_nested_attributes_for :enrollment_activities, :allow_destroy => true
  has_one_attached :transcript


  validates :high_school_name, presence: true
  validates :high_school_address1, presence: true
  validates :high_school_city, presence: true
  validates :high_school_country, presence: true
  validates :year_in_school, presence: true
  validates :anticipated_graduation_year, presence: true
  validates :personal_statement, presence: true
  validates :personal_statement, length: { minimum: 100 }

  validate :at_least_one_is_checked

  def display_name
    self.user.email # or whatever column you want
  end

  private

  def at_least_one_is_checked
    if session_registration_ids.empty?
      errors.add(:base, "Select at least one session")
    end
  end

  # scope :current_enrollment, ->(user=@current_user) { where(user_id: user) }
end
