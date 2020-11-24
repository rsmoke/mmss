class RecuploadsController < InheritedResources::Base
  before_action :authenticate_admin!, except: [:index, :success, :error, :show, :new, :create]
  before_action :set_recupload, only: [:show, :edit, :update, :destroy]
  before_action :get_recommendation, only: [:new]

  def index
    redirect_to root_path unless admin_signed_in?

  end

  def show

  end

  def error

  end

  def success

  end

  def new
    if @recommendation.recupload.present?
      redirect_to recupload_error_path, alert: "A recommendation has already been submitted for this user"
    else
      @recupload = @recommendation.build_recupload
    end
  end

  def edit

  end

  def create
    @recupload = Recupload.new(recupload_params)

    respond_to do |format|
      if @recupload.save
        format.html { redirect_to recupload_success_path, notice: 'Recommendation was successfully uploaded.' }
        format.json { render :show, status: :created, location: @recupload }
        RecuploadMailer.with(recupload: @recupload).received_email.deliver_now
        RecuploadMailer.with(recupload: @recupload).applicant_received_email.deliver_now
        recom_id = @recupload.recommendation_id
        enroll_id = Recommendation.find(recom_id).enrollment_id
        if Payment.where(user_id: Enrollment.find(enroll_id).user_id).current_camp_payments.exists?
         Enrollment.find(enroll_id).update!(application_status: "application complete")
        end
      else
        format.html { render :new }
        format.json { render json: @recupload.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy
    @recupload.destroy
    respond_to do |format|
      format.html { redirect_to recuploads_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_recupload
      @recupload = Recupload.find(params[:id])
    end

    def get_recommendation
      hash_val = params['hash']
      rec_id = hash_val.split("nGklDoc2egIkzFxr0U").last.to_i
      @recommendation = Recommendation.find(rec_id)
    end

    def recupload_params
      params.require(:recupload).permit(:letter, :authorname, :studentname, :recommendation_id, :rechash, :recletter)
    end

end
