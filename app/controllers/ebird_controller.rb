# frozen_string_literal: true

require 'net/http'
require 'json'

# General API for birds/hotspots
class EbirdController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include EbirdHelper
  def birds
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = (params[:radius] || 50).to_i
    hotspot = params[:hotspot]
    birds = hotspot ? getHotspotBirdData(hotspot) : get_bird_data(lat, lng, radius)
    render json: birds
  end

  def bird
    sci = params[:sci]
    com = params[:com]
    img = get_img_src(com, sci)
    render json: {
      img: img
    }
  end

  def hotspots
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    radius = (params[:radius] || 50).to_i
    hotspots = get_hotspot_data(lat, lng, radius)
    render json: hotspots
  end
end
