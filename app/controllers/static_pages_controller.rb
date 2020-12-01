class StaticPagesController < ApplicationController
  before_action :set_current_enrollment

  def index
    @application_materials_due_date = CampConfiguration.active_camp_materials_due_date
  end

  def contact
  end

  def privacy
  end

  private
    def set_current_enrollment
      if user_signed_in?
        @current_enrollment = current_user.enrollments.current_camp_year_applications
      end
    end
end
