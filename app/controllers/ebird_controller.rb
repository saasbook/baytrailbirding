require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper

class EbirdController < ApplicationController
  include EbirdHelper
  def data
      lat = params[:lat]
      lng = params[:lng]
      rare = params[:rare] || false
      num_req = params[:num_req].to_i || 100
      num_ret = params[:num_ret].to_i || 1
      selected_birds = getBirdData(lat, lng, num_req, num_ret, rare)
      img_src = []
      selected_birds.each { |bird_data|
          img_src.append(getImageSrc(bird_data))
      }
      render :json => {'imgsrc':img_src,'birddata':selected_birds}
  end
end
