class RecommendationMailer < ApplicationMailer

  default from: 'University of Michigan MMSS High School Summer Program <mmss-recommend@umich.edu>'

  def request_email
    @recommendation = params[:recommendation]
    @enrollment = Enrollment.find(@recommendation.enrollment_id)
    @student = ApplicantDetail.find_by(user_id: @enrollment.user_id)
    @hashval = "thisisasha256hash" # sha256_hash
    @url  = "https://lsa-math-mmss.miserver.it.umich.edu/recommendation?id=#{ @student.id }&yr=#{CampConfiguration.active_camp_year}&email=#{ @recommendation.email }&hash=#{ @hashval }"
    mail(to: @recommendation.email, subject: "Recommendation for #{@student.firstname} #{@student.lastname}")
  end

end
