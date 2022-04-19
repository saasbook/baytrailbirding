require 'faraday'
require 'json'
include ActionView::Helpers::NumberHelper

module EbirdHelper
  def getBirdData(lat,lng, num_req=100, num_ret=1)
    ebird_params = {  :lat => number_with_precision(lat, precision: 2),
                      :lng => number_with_precision(lng, precision: 2),
                      :maxResults => num_req,
                      :back => 10,
                      :dist => 25,
                    }

    url = "https://api.ebird.org/v2/data/obs/geo/recent/"

    resp = Faraday.get(url) do |req|
      req.params = ebird_params
      req.headers = {"X-eBirdApiToken" => "3nt7houcf01l"}
    end

    body = resp.body


    bird_data = select_random_birds(JSON.parse(body),num_ret)


    #bird_data = addBirdDist(lat, lng, bird_data)
    bird_data.each do |bird|
      bird["distTo"] = number_with_precision(hav_distance([lat.to_f,lng.to_f],
                                          [ bird["lat"].to_f,bird["lng"].to_f],
                                          true), precision: 1);
    end
    return bird_data

  end

  #need to make new function to stub it dumb hate this
  def select_random_birds(birds, num_ret)
    birds.sample(num_ret)
  end

  #def addBirdDist(lat,lng,bird_data)
  #    bird_data.map {|x| haversine_distance_wrapper(x,3)}
  #    haversine_distance(lat,lng,bird_data)
  #end

  def hav_distance(geo_a, geo_b, miles=false)
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
      begin
        img_src = getImageFromName(bird_data["sciName"])
      rescue NoMethodError => e2
        img_src = nil
      end
    end
    return img_src
  end



  def getImageFromName(name)

    #check cache for bird name
    wikimedia_params = {
      :action => "query",
      :prop => "pageimages",
      :format => "json",
      :piprop => "original",
      :titles => name,
      :redirects => 1
    }


    resp = Faraday.get("https://en.wikipedia.org/w/api.php") do |req|
      req.params = wikimedia_params
    end

    body = resp.body
    image_data = JSON.parse(body)

    image_pages = image_data["query"]["pages"]
    first_page = image_pages[image_pages.keys[0]]
    image_src = first_page["original"]["source"]

    #put bird name and image into cache
    return image_src

  end
end
