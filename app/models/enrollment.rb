class Enrollment < ApplicationRecord
  belongs_to :user
  has_one :applicant_detail, through: :user

  has_many :enrollment_activities
  has_many :registration_activities, through: :enrollment_activities, source: :activity

  has_many :session_activities
  has_many :session_registrations, through: :session_activities, source: :camp_occurrence

  has_many :course_preferences
  has_many :courses, through: :course_preferences

  has_one :financial_aid
  has_many :travels
  has_one :recommendation

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

  scope :current_user_enrollments, ->(user=@current_user) { where(user_id: user) }
end
