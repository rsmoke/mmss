class OfferMailer < ApplicationMailer
  default from: 'University of Michigan MMSS High School Summer Program <mmss@umich.edu>'

  def offer_email(user)
    @offer_letter_text = CampConfiguration.active.last.offer_letter
    @user_detail = User.find(user)
    @application = ApplicantDetail.find_by(user_id: user)
    @enrollment = Enrollment.find_by(user_id: user)
    @assigned_courses = @enrollment.course_assignments
    @assigned_sessions = @enrollment.session_assignments
    @url = "https://lsa-math-mmss.miserver.it.umich.edu"
    @camp_config = CampConfiguration.find_by(active: true)
    mail(to: @user_detail.email, subject: "UM MMSS: Offer to attend Michigan Math and Science Scholars")
  end
end


