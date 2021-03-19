class ApplicationController < ActionController::Base
  def index
  	@locations_full = Location.all
  end

  def show
  end
end
