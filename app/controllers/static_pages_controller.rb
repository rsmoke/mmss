class StaticPagesController < ApplicationController


  def index
    @application_materials_due_date = CampConfiguration.active_camp_materials_due_date
  end

  def contact
  end

  def privacy
  end
end
