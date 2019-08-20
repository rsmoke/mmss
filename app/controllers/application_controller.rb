class ApplicationController < ActionController::Base
  before_action :signed_in?
end
