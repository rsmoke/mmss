class ApplicationController < ActionController::Base

  # this needs to be called from payment#payment_receipt and enrollment#update
# def set_application_status_to_enrolled
#   if current_enrollment.student_packet.attached? && current_enrollment.balance_due == 0
#     @current_enrollment.update!(application_status: "enrolled")
#     RegistrationMailer.app_enrolled_email(current_user).deliver_now
#   end
# end

private



end
