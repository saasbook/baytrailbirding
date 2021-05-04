class ApplicationController < ActionController::Base
  def index
  	@locations_full = Location.all
  end

  def show
  	@locations_full = Location.all
  	# @distance = haversine_distance([120, 10],[120, 12], true)
    user_IP = '67.170.238.57'
    if IPAddress.valid? request.remote_ip and request.remote_ip != '127.0.0.1'
      user_IP = request.remote_ip 
    end
    results = Geocoder.search(user_IP)
    @current_location = results.first.coordinates    
  end
end
