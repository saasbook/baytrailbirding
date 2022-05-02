require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper
include EbirdHelper

class EbirdController < ApplicationController
  def birds
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = (params[:radius] || 50).to_i
    hotspot = params[:hotspot]
    birds = []
    if hotspot
      birds = getHotspotBirdData(hotspot);
    else
      birds = getBirdData(lat, lng, radius);
    end
    render :json => birds
  end
  def bird
    sci = params[:sci]
    com = params[:com]
    img = getImageSrc(com, sci)
    render :json => {
      :img => img
    }  
  end
  def hotspots
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = (params[:radius] || 50).to_i
    hotspots = getHotspotData(lat, lng, radius);
    render :json => hotspots
  end
  def locations
    calc_location()
    locations_full = Location.all.sort_by{|location| hav_distance([location.latitude.to_f, location.longitude.to_f], @current_location)}
    render :json => locations_full
  end

  def calc_location
    @current_location = [37.8039, -122.2591]
    if IPAddress.valid? request.remote_ip and request.remote_ip != '127.0.0.1'
      user_IP = request.remote_ip
      results = Geocoder.search(user_IP)
      if results.first.coordinates and results.first.coordinates.any?
        @current_location = results.first.coordinates
      end
    end
  end
end
