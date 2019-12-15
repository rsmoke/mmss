class ApplicationController < ActionController::Base

private

  def user_has_application?(user)
    # return true unless Application.find_by(user_id: user).nil?
    if ApplicantDetail.find_by(user_id: user).nil?
      false
    else
      true
    end
  end

  helper_method :user_has_application?



end
