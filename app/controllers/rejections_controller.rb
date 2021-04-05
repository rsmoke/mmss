class RejectionsController < InheritedResources::Base

  # POST /genders
  # POST /genders.json
  def create
    @gender = Gender.new(gender_params)

    respond_to do |format|
      if @gender.save
        format.html { redirect_to @gender, notice: 'Gender was successfully created.' }
        format.json { render :show, status: :created, location: @gender }
        Enrollment.find(enrollment_id).update!(application_status: "rejected")
        
      else
        format.html { render :new }
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genders/1
  # PATCH/PUT /genders/1.json
  def update
    respond_to do |format|
      if @gender.update(gender_params)
        format.html { redirect_to @gender, notice: 'Gender was successfully updated.' }
        format.json { render :show, status: :ok, location: @gender }
      else
        format.html { render :edit }
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def rejection_params
      params.require(:rejection).permit(:enrollment_id, :reason)
    end

end
