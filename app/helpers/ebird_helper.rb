require 'faraday'
require 'json'
include ActionView::Helpers::NumberHelper

module EbirdHelper
  def getBirdData(lat,lng, num_req=100, num_ret=1, rare=false)
    ebird_params = {  :lat => number_with_precision(lat, precision: 2),
                      :lng => number_with_precision(lng, precision: 2),
                      :maxResults => num_req,
                      :back => 10,
                      :dist => 25,
                    }

    url = "https://api.ebird.org/v2/data/obs/geo/recent/"
    if rare == true
      url = "https://api.ebird.org/v2/data/obs/geo/recent/notable"
    end

    resp = Faraday.get(url) do |req|
      req.params = ebird_params
      req.headers = {"X-eBirdApiToken" => "a9qvaguuedjc"}
    end

    body = resp.body


    bird_data = select_random_birds(JSON.parse(body),num_ret)


    #bird_data = addBirdDist(lat, lng, bird_data)
    bird_data.each do |bird|
      bird["distTo"] = number_with_precision(haversine_distance([lat.to_f,lng.to_f],
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



  def getImageFromName(name)

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

    return image_src

  end
end
