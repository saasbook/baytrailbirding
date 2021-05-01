class ApplicationController < ActionController::Base
  def index
  	@locations_full = Location.all
  end

  def show
  	@locations_full = Location.all
  	# @distance = haversine_distance([120, 10],[120, 12], true)
    sample_user_IP = '67.170.238.57'
    user_IP = request.remote_ip 
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


  def getImageSrc(bird_data)
    img_src = 'never set'
    begin
      img_src = getImageFromName(bird_data["comName"])
    rescue NoMethodError => e1
      puts e1
      begin
        img_src = getImageFromName(bird_data["sciName"])
      rescue NoMethodError => e2
        puts e2
        img_src = nil
      end
    end
    return img_src
  end

  helper_method :haversine_distance
end
