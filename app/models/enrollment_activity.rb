class EnrollmentActivity < ApplicationRecord
  belongs_to :enrollment
  belongs_to :activity

  validates_presence_of :enrollment
  validates_presence_of :activity

  # accepts_nested_attributes_for :enrollment
end
