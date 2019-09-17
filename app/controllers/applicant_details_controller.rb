class ApplicantDetailsController < ApplicationController
  before_action :set_applicant_detail, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin!, only: [:index]

  # GET /applicant_details
  # GET /applicant_details.json
  def index
    @applicant_details = ApplicantDetail.all
  end

  # GET /applicant_details/1
  # GET /applicant_details/1.json
  def show
  end

  # GET /applicant_details/new
  def new
    @applicant_detail = ApplicantDetail.new
  end

  # GET /applicant_details/1/edit
  def edit
  end

  # POST /applicant_details
  # POST /applicant_details.json
  def create
    @applicant_detail = current_user.create_applicant_detail!(applicant_detail_params)
    # @applicant_detail.user_id = .id if current_user

    respond_to do |format|
      if @applicant_detail.save
        format.html { redirect_to @applicant_detail, notice: 'Applicant detail was successfully created.' }
        format.json { render :show, status: :created, location: @applicant_detail }
      else
        format.html { render :new }
        format.json { render json: @applicant_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_details/1
  # PATCH/PUT /applicant_details/1.json
  def update
    respond_to do |format|
      if @applicant_detail.update(applicant_detail_params)
        format.html { redirect_to @applicant_detail, notice: 'Applicant detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant_detail }
      else
        format.html { render :edit }
        format.json { render json: @applicant_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_details/1
  # DELETE /applicant_details/1.json
  def destroy
    @applicant_detail.destroy
    respond_to do |format|
      format.html { redirect_to applicant_details_url, notice: 'Applicant detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_detail
      @applicant_detail = ApplicantDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_detail_params
      params.require(:applicant_detail).permit(:user_id, :firstname, :middlename, :lastname, :gender, :us_citizen, :demographic, :birthdate, :diet_restrictions, :shirt_size, :address1, :address2, :city, :state, :state_non_us, :postalcode, :country, :phone, :parentname, :parentaddress1, :parentaddress2, :parentcity, :parentstate, :parentstate_non_us, :parentzip, :parentcountry, :parentphone, :parentworkphone, :parentemail)
    end
end
