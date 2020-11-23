# == Schema Information
#
# Table name: enrollment_activities
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  activity_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class EnrollmentActivity < ApplicationRecord
  belongs_to :enrollment
  belongs_to :activity

  validates_presence_of :enrollment
  validates_presence_of :activity

end
