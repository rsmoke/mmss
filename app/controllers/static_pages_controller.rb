class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
  end

  def contact
  end

  def privacy
  end
end
