class ApplicationController < ActionController::Base
  include EbirdHelper
  def index
    calc_location()
    @locations_full = Location.all.sort_by{|location| hav_distance([location.latitude.to_f, location.longitude.to_f], @current_location)}
    #lat = params[:lat].to_f
    #lng = params[:lng].to_f
    #locations = getHotspotData(lat, lng);
    #render :json => @locations_full
    return @locations_full
  end

  def show
    calc_location()
  	@locations_full = Location.all.sort_by{|location| hav_distance([location.latitude.to_f, location.longitude.to_f], @current_location)}
  end
end
