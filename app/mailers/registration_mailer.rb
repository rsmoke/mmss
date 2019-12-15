class RegistrationMailer < ApplicationMailer
  default from: 'University of Michigan MMSS High School Summer Program <mmss@umich.edu>'

  def app_complete_email(user)
    @user_detail = user
    @application = ApplicantDetail.find_by(user_id: user)
    @url = "https://lsa-miserver.mmss.miserver.it.umich.edu"
    @camp_config = CampConfiguration.find_by(active: true)
    mail(to: user.email, subject: "UM MMSS: Confirmation of application")
  end
end
