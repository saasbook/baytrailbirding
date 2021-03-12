class ApplicationController < ActionController::Base
  def index
  	@locations_full = Location.all
  end
end
