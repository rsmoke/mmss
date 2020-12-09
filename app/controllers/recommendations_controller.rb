class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  devise_group :logged_in, contains: [:user, :admin]
  before_action :set_current_enrollment, except: [:send_request_email]
  # before_action :authenticate_logged_in!
  # GET /recommendations
  # GET /recommendations.json
  def index
    @enrollment = Enrollment.find(params[:enrollment_id])
    @recommendations = Recommendation.all
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    # @enrollment = Enrollment.find(params[:enrollment_id])
  end

  # GET /recommendations/new
  def new
    @enrollment = Enrollment.find_by(id: params[:enrollment_id])
    @recommendation = @enrollment.build_recommendation
  end

  # GET /recommendations/1/edit
  def edit
    if @current_enrollment.recommendation.recupload.present?
      redirect_to root_path
    end
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @enrollment = Enrollment.find_by(id: params[:enrollment_id])
    @recommendation = @enrollment.build_recommendation(recommendation_params)

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to root_path, notice: 'Recommendation was successfully created and the email was sent.' }
        format.json { render :show, status: :created, location: @recommendation }
        RecommendationMailer.with(recommendation: @recommendation).request_email.deliver_now
      else
        format.html { render :new }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommendations/1
  # PATCH/PUT /recommendations/1.json
  def update
    respond_to do |format|
      if @recommendation.update(recommendation_params)
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommendation }
      else
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @enrollment = Enrollment.find_by(id: params[:enrollment_id])
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to enrollment_recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_request_email(recommendation_id)
    @recommendation = Recommendation.find(recommendation_id)
    RecommendationMailer.with(recommendation: @recommendation).request_email.deliver_now
    flash.now[:notice] = 'Request was sent!'
  end

  private

    def set_current_enrollment
      @current_enrollment = current_user.enrollments.current_camp_year_applications.last
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_params
      params.require(:recommendation).permit(:enrollment_id, :email, :lastname, :firstname, :organization, :address1, :address2, :city, :state, :state_non_us, :postalcode, :country, :phone_number, :best_contact_time, :submitted_recommendation, :date_submitted)
    end
end
