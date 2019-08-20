class StaticPagesController < ApplicationController
  skip_before_action :signed_in!
  
  def index
  end

  def contact
  end

  def privacy
  end
end
