class ApplicationController < ActionController::Base

private

  def user_has_application?(user)
    # return true unless Application.find_by(user_id: user).nil?
    if Application.find_by(user_id: user).nil?
      false
    else
      true
    end
  end

  helper_method :user_has_application?

  def user_has_payments?(user)
    # return true unless Payment.find_by(user_id: user).nil?
    if Payment.find_by(user_id: user).nil?
      false
    else
      true
    end
  end

  def payments_open?
    true
  end

  helper_method :payments_open?
end
