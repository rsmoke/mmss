class SessionAssignmentsController < ApplicationController

  def accept_session_offer
    @session_assignment = SessionAssignment.find(params[:id])
    respond_to do |format|
      if @session_assignment.update(offer_status: "accepted")
        # session_id = @session_assignment.camp_occurrence_id
        # session_courses_ids = CampOccurrence.find(session_id).courses.pluck(:id)
        # current_enrollment = current_user.enrollments.last
        # @course_assignment = CourseAssignment.where(enrollment_id: current_enrollment, course_id: session_courses_ids)
        @course_assignment = CourseAssignment.find_by(enrollment_id: @session_assignment.enrollment_id, course_id: CampOccurrence.find(@session_assignment.camp_occurrence_id).courses.ids)
        OfferMailer.offer_accepted_email(current_user, @session_assignment, @course_assignment).deliver_now
        status_array = SessionAssignment.where(enrollment_id: current_enrollment).pluck(:offer_status)
        if status_array.count("accepted") + status_array.count("declined") == status_array.size
          enroll_id = @session_assignment.enrollment_id
          Enrollment.find(enroll_id).update(offer_status: "accepted", application_status: "offer accepted")
        end
        format.html { redirect_to all_payments_path, notice: 'Session assignment was successfully accepted.' }
        format.json { render :show, status: :ok, location: @session_assignment }
      else
        format.html { redirect_to root_path, notice: 'There was a problem processing the offer.' }
        format.json { render json: @session_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def decline_session_offer
    @session_assignment = SessionAssignment.find(params[:id])
    respond_to do |format|
      if @session_assignment.update(offer_status: "declined")
        # current_enrollment = current_user.enrollments.last
        # session_id = @session_assignment.camp_occurrence_id
        # session_courses_ids = CampOccurrence.find(session_id).courses.pluck(:id)
        # @course_assignment = CourseAssignment.where(enrollment_id: current_enrollment, course_id: session_courses_ids)
        @course_assignment = CourseAssignment.find_by(enrollment_id: @session_assignment.enrollment_id, course_id: CampOccurrence.find(@session_assignment.camp_occurrence_id).courses.ids)
        OfferMailer.offer_declined_email(current_user, @session_assignment, @course_assignment).deliver_now
        if CourseAssignment.where(enrollment_id: current_enrollment, course_id: session_courses_ids).exists?
          CourseAssignment.where(enrollment_id: current_enrollment, course_id: session_courses_ids).destroy_all
        end
        status_array = SessionAssignment.where(enrollment_id: current_enrollment).pluck(:offer_status)
        if status_array.count("declined") == status_array.size
          enroll_id = @session_assignment.enrollment_id
          Enrollment.find(enroll_id).update(offer_status: "declined", application_status: "offer declined")
          format.html { redirect_to root_path, notice: 'Session assignment was declined.' }
          format.json { render :show, status: :ok, location: @session_assignment }
        elsif status_array.count("accepted") + status_array.count("declined") == status_array.size
          enroll_id = @session_assignment.enrollment_id
          Enrollment.find(enroll_id).update(offer_status: "accepted", application_status: "offer accepted")
          format.html { redirect_to all_payments_path, notice: 'Session assignment was declined.' }
          format.json { render :show, status: :ok, location: @session_assignment }
        else
          format.html { redirect_to root_path, notice: 'Session assignment was declined.' }
          format.json { render :show, status: :ok, location: @session_assignment }
        end

      else
        format.html { redirect_to root_path, notice: 'There was a problem processing the offer.' }
        format.json { render json: @session_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def session_assignment_params
      params.require(:session_assignment).permit(:enrollment_id, :camp_occurrence_id)
    end

    # def set_session_assignment
    #   @session_assignment = SessionAssignment.where(enrollment_id: current_enrollment)
    # end

    def current_enrollment
      @current_enrollment = current_user.enrollments.last
    end

end
