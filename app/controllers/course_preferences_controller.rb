class CoursePreferencesController < ApplicationController

  before_action :current_enrollment

  def index
    # @course_preferences = CoursePreference.all
    # @current_enrollment = current_user.enrollments.last
    # @current_user_sessions = @current_enrollment.session_registrations.pluck(:description)
    @current_enrollment_course_preferences_all = @current_enrollment.course_preferences

    @current_enrollment_session1 = @current_enrollment.session_registrations.find_by(description: "Session 1")
    @current_enrollment_session2 = @current_enrollment.session_registrations.find_by(description: "Session 2")
    @current_enrollment_session3 = @current_enrollment.session_registrations.find_by(description: "Session 3")
 
    @current_enrollment_session1_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session1)
    @current_enrollment_session2_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session2)
    @current_enrollment_session3_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session3)
  end

  def show
    # @current_enrollment = current_user.enrollments.last
 
    @current_enrollment_session1 = @current_enrollment.session_registrations.find_by(description: "Session 1")
    @current_enrollment_session2 = @current_enrollment.session_registrations.find_by(description: "Session 2")
    @current_enrollment_session3 = @current_enrollment.session_registrations.find_by(description: "Session 3")
 
    @current_enrollment_session1_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session1)
    @current_enrollment_session2_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session2)
    @current_enrollment_session3_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session3)

    @current_user_course_preferences_all = @current_enrollment.course_preferences

  end

  def new
    # @current_enrollment = current_user.enrollments.last
    @course_preference = CoursePreference.new
    @current_enrollment_session1 = @current_enrollment.session_registrations.find_by(description: "Session 1")
    @current_enrollment_session1_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session1)
    @current_enrollment_session2 = @current_enrollment.session_registrations.find_by(description: "Session 2")
    @current_enrollment_session2_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session2)
    @current_enrollment_session3 = @current_enrollment.session_registrations.find_by(description: "Session 3")
    @current_enrollment_session3_courses = @current_enrollment.course_registrations.where(camp_occurrence: @current_enrollment_session3)


  end

  def create
    @course_preference = CoursePreference.new(cp_params)

    respond_to do |format|
      if @course_preference.save
        format.html { redirect_to enrollment_course_preferences_path(@current_enrollment), notice: 'Course Preference was successfully edited.' }
        format.json { render :show, status: :created, location: @course_preference }
      else
        format.html { render :new }
        format.json { render json: @course_preference.errors, status: :unprocessable_entity }
      end
    end

    # redirect_to enrollment_course_preferences_path(@current_enrollment), notice: 'Course Preference was successfully edited.' 
    # respond_to do |format|
    #   if @current_course_pref.update(ranking: params[:course_preference][:ranking])
    #     format.html { redirect_to course_preferences_path, notice: 'Course Preference was successfully edited.' }
    #     format.json { render :show, status: :ok, location: @course_preference }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @course_preference.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def edit
    @current_enrollment_session2_courses
  end

  def update
    respond_to do |format|
      if @current_enrollment.course_preferences.update(enrollment_params)
        format.html { redirect_to course_preferences_path, notice: 'Course Preference was successfully updated.' }
        format.json { render :show, status: :ok, location: course_preferences_path }
      else
        format.html { render :edit }
        format.json { render json: @course_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def current_enrollment
      @current_enrollment = current_user.enrollments.last
    end

    def cp_params
      params.require(:course_preference).permit(:course_preference,:course_id, :ranking)
    end
end
