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

  def haversine_distance(geo_a, geo_b, miles=false)
    # Get latitude and longitude
    lat1, lon1 = geo_a
    lat2, lon2 = geo_b

    # Calculate radial arcs for latitude and longitude
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180


    a = Math.sin(dLat / 2) *
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) *
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)

     c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    d = 6371 * c * (miles ? 1 / 1.6 : 1)
  end

  helper_method :haversine_distance
end
