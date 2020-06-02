class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy, :accept_offer, :decline_offer]
  devise_group :logged_in, contains: [:user, :admin]
  before_action :authenticate_logged_in!
  # GET /enrollments
  # GET /enrollments.json
  def index
    if admin_signed_in?
      @enrollments = Enrollment.all
    else
      redirect_to root_path
    end
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
    @registration_activities = @enrollment.registration_activities.order(camp_occurrence_id: :asc)
    @session_registrations = @enrollment.session_registrations.order(description: :asc)
    @course_registrations = @enrollment.course_registrations.order(camp_occurrence_id: :asc)
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
    @courses_session1 = CampOccurrence.session_description("Session 1").courses
    @courses_session2 = CampOccurrence.session_description("Session 2").courses
    @courses_session3 = CampOccurrence.session_description("Session 3").courses

    @activities_session1 = CampOccurrence.session_description("Session 1").activities
    @activities_session2 = CampOccurrence.session_description("Session 2").activities
    @activities_session3 = CampOccurrence.session_description("Session 3").activities
  end

  # GET /enrollments/1/edit
  def edit
    @courses_session1 = CampOccurrence.session_description("Session 1").courses
    @courses_session2 = CampOccurrence.session_description("Session 2").courses
    @courses_session3 = CampOccurrence.session_description("Session 3").courses

    @activities_session1 = CampOccurrence.session_description("Session 1").activities
    @activities_session2 = CampOccurrence.session_description("Session 2").activities
    @activities_session3 = CampOccurrence.session_description("Session 3").activities
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = current_user.enrollments.create(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to root_path, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to root_path, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept_offer
    respond_to do |format|
      if @enrollment.update(offer_status: "accepted", application_status: "enrolled")
        format.html { redirect_to all_payments_path, notice: 'Offer was successfully accepted.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { redirect_to root_path, notice: 'There was a problem processing the offer.' }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  def  decline_offer
    respond_to do |format|
      if @enrollment.update(offer_status: "declined")
        format.html { redirect_to root_path, notice: 'Offer was successfully declined.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { redirect_to root_path, notice: 'There was a problem processing the offer.' }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find_by(user_id: current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(
                          :user_id, :international, :high_school_name,
                          :high_school_address1, :high_school_address2,
                          :high_school_city, :high_school_state,
                          :high_school_non_us, :high_school_postalcode,
                          :high_school_country, :year_in_school,
                          :anticipated_graduation_year, :room_mate_request,
                          :personal_statement, :shirt_size, :notes,
                          :application_status, :offer_status,
                          :partner_program, :transcript,
                          registration_activity_ids: [],
                          session_registration_ids: [],
                          course_registration_ids: [],
                          course_preferences_attributes: [:course_id, :enrollment_id, :ranking])
    end
end
