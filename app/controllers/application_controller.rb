class ApplicationController < ActionController::Base
  include EbirdHelper 
  def index
    calc_location()  
    @locations_full = Location.all.sort_by{|location| hav_distance([location.latitude.to_f, location.longitude.to_f], @current_location)}
  end

  def show
    calc_location()  
  	@locations_full = Location.all
  	# @distance = haversine_distance([120, 10],[120, 12], true)
  end

  def calc_location
    user_IP = '67.170.238.57'
    if IPAddress.valid? request.remote_ip and request.remote_ip != '127.0.0.1'
      user_IP = request.remote_ip 
    end
    results = Geocoder.search(user_IP)
    @current_location = results.first.coordinates   
  end
end
