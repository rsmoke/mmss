class FeedbacksController < ApplicationController
  devise_group :logged_in, contains: [:user, :admin]
  before_action :authenticate_logged_in!
  before_action :authenticate_admin!, only: [:index, :destroy]
  # InheritedResources::Base
  # see https://railsguides.net/clean-up-controllers-with-inherited-resources/

  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
        FeedbackMailer.with(feedback: @feedback).feedback_email.deliver_now
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:user_id, :genre, :message)
    end

end
