class RejectedMailer < ApplicationMailer

  default from: 'University of Michigan MMSS High School Summer Program <mmss@umich.edu>'

  def app_rejected_email(enrollment)
    @application = ApplicantDetail.find_by(user_id: enrollment.user)
    @reason = Rejection.find_by(enrollment_id: enrollment).reason
    @camp_config = CampConfiguration.find_by(active: true)
    mail(to: enrollment.user.email, subject: "UM MMSS: Application Rejected")
  end
end
