class CoursePreferencesController < ApplicationController

  def index
    @course_preferences = CoursePreference.all
    @current_enrollment = current_user.enrollments.last
    @current_user_sessions = @current_enrollment.session_registrations.pluck(:description)
    @current_user_course_preferences = @current_enrollment.course_preferences
    @current_user_course_ids = @current_user_course_preferences.pluck(:course_id)
    @courses_session1 = CampOccurrence.session_description("Session 1").courses
    @courses_session2 = CampOccurrence.session_description("Session 2").courses
    @courses_session3 = CampOccurrence.session_description("Session 3").courses
  end

  def new
    @courses_session1 = CampOccurrence.session_description("Session 1").courses
    @courses_session2 = CampOccurrence.session_description("Session 2").courses
    @courses_session3 = CampOccurrence.session_description("Session 3").courses
    @course_preference = CoursePreference.new
  end

  def create
    @current_enrollment = current_user.enrollments.last
    if @current_enrollment.course_preferences.find_by(course_id: params[:course_preference][:course_id]).present?
      @current_course_pref_id = @current_enrollment.course_preferences.find_by(course_id: params[:course_preference][:course_id]).id
      @current_course_pref = @current_enrollment.course_preferences.find(@current_course_pref_id)
        if params[:course_preference][:ranking] == ""
          @current_course_pref.delete
          respond_to do |format|
            format.html { redirect_to course_preferences_path, notice: 'Course Preference was successfully edited.' }
            format.json { head :no_content }
          end
        else
          respond_to do |format|
            if @current_course_pref.update(ranking: params[:course_preference][:ranking])
            # if @course_preference.save
              format.html { redirect_to course_preferences_path, notice: 'Course Preference was successfully edited.' }
              format.json { render :show, status: :ok, location: @course_preference }
            else
              format.html { render :edit }
              format.json { render json: @course_preference.errors, status: :unprocessable_entity }
            end
          end
        end
    else
      if params[:course_preference][:ranking] == ""
        redirect_to course_preferences_path
      else
        @course_preference = @current_enrollment.course_preferences.create(cp_params)
        respond_to do |format|
          if @course_preference.save
            format.html { redirect_to course_preferences_path, notice: 'Course Preference was successfully edited.' }
            format.json { render :show, status: :created, location: @course_preference }
          else
            format.html { render :new }
            format.json { render json: @@course_preference.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  def edit
    @courses_session1 = CampOccurrence.session_description("Session 1").courses
    @courses_session2 = CampOccurrence.session_description("Session 2").courses
    @courses_session3 = CampOccurrence.session_description("Session 3").courses
  end

  def update
    respond_to do |format|
      if current_user.enrollments.last.course_preferences.update(enrollment_params)
        format.html { redirect_to course_preferences_path, notice: 'Course Preference was successfully updated.' }
        format.json { render :show, status: :ok, location: course_preferences_path }
      else
        format.html { render :edit }
        format.json { render json: @course_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def cp_params
      params.require(:course_preference).permit(:course_preference,:course_id, :ranking)
    end
end
