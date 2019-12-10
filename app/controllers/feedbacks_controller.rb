class FeedbacksController < InheritedResources::Base

  private

    def feedback_params
      params.require(:feedback).permit()
    end

end
