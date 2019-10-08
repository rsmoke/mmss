class RecommendationMailer < ApplicationMailer

  default from: 'University of Michigan MMSS High School Summer Program <mmss-recommend@umich.edu >'
 
  def welcome_email
    @user = params[:user]
    @hashval = "thisisasha256hash" # sha256_hash
    @url  = "http://www.math.lsa.umich.edu/mmss/mmss_recommender.php?id=" + @enrollment.id + "&yr=" + enrollment.year + "&email=" + @recommendation.email + "&hash=" + $hashval
    mail(to: @user.email, subject: 'Recommendation for @user.firstname @user.firstlname')
  end

end
