class Enrollment < ApplicationRecord
  belongs_to :user
  has_one :applicant_detail, through: :user

  has_many :enrollment_activities, dependent: :destroy
  has_many :registration_activities, through: :enrollment_activities, source: :activity

  has_many :session_activities, dependent: :destroy 
  has_many :session_registrations, through: :session_activities, source: :camp_occurrence

  has_many :session_assignments

  has_many :course_preferences, dependent: :destroy
  has_many :course_registrations, through: :course_preferences, source: :course
  accepts_nested_attributes_for :course_preferences, allow_destroy: true

  has_many :course_assignments, dependent: :destroy

  has_one :financial_aid, dependent: :destroy
  has_many :travels, dependent: :destroy
  has_one :recommendation, dependent: :destroy

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
  validate :acceptable_transcript

  scope :offered, ->{where("offer_status = 'offered'")}
  scope :accepted, -> {where("offer_status = 'accepted'")}
  scope :enrolled, -> {where("application_status = 'enrolled'")}

  def display_name
    self.user.email # or whatever column you want
  end

  private

  def at_least_one_is_checked
    if session_registration_ids.empty?
      errors.add(:base, "Select at least one session")
    end
  end

  def acceptable_transcript
    return unless transcript.attached?

    unless transcript.blob.byte_size <= 20.megabyte
      errors.add(:transcript, "is too big - file size cannot exceed 20Mbyte")
    end

    acceptable_types = ["image/png", "image/jpeg", "application/pdf"]
    unless acceptable_types.include?(transcript.content_type)
      errors.add(:transcript, "must be file type PDF, JPEG or PNG")
    end
  end

  # scope :current_enrollment, ->(user=@current_user) { where(user_id: user) }
end
