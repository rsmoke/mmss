# == Schema Information
#
# Table name: rejections
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  reason        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Rejection < ApplicationRecord
  after_commit :set_rejection_status, if: :persisted?
  belongs_to :enrollment

  validates :reason, presence: true


  def set_rejection_status
    if CourseAssignment.where(enrollment_id: enrollment).present?
      CourseAssignment.where(enrollment_id: enrollment).each do |ca|
        ca.destroy
      end
    end
    
    if SessionAssignment.where(enrollment_id: enrollment).present?
      SessionAssignment.where(enrollment_id: enrollment).each do |sa|
        sa.destroy
      end
    end

    Enrollment.find(enrollment_id).update!(application_status: "rejected", offer_status: "")
  end

end
