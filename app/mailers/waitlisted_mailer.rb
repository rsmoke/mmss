class WaitlistedMailer < ApplicationMailer

  default from: 'University of Michigan MMSS High School Summer Program <mmss@umich.edu>'

  def app_waitlisted_email(enrollment)
    @application = ApplicantDetail.find_by(user_id: enrollment.user)
    @camp_config = CampConfiguration.find_by(active: true)
    mail(to: enrollment.user.email, subject: "UM MMSS: Application Wait-listed")
  end
end
