class RecuploadMailer < ApplicationMailer
    default from: 'University of Michigan MMSS High School Summer Program <mmss-recommend@umich.edu>'

  def received_email
    @recupload = params[:recupload]
    @recommendation = Recommendation.find(@recupload.recommendation_id)
    @student = @recommendation.enrollment.user.applicant_detail
    mail(to: @recommendation.email, subject: "Recommendation for #{@student.firstname} #{@student.lastname}")
  end

end
