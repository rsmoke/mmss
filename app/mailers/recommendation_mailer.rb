class RecommendationMailer < ApplicationMailer

  default from: 'University of Michigan MMSS High School Summer Program <mmss-recommend@umich.edu >'
 
  def welcome_email
    @recommendation = params[:recommendation]
    @enrollment = Enrollment.find(@recommendation.enrollment_id)
    @student = ApplicantDetail.find_by(user_id: @enrollment.user_id)
    @hashval = "thisisasha256hash" # sha256_hash
    @url  = "http://www.math.lsa.umich.edu/mmss/mmssation.php?id=#{ @student.id }&yr=#{CampConfiguration.active_camp_year}&email=#{ @recommendation.email }&hash=#{ @hashval }"
    mail(to: @recommendation.email, subject: "Recommendation for #{@student.firstname} #{@student.lastname}")
  end

end
