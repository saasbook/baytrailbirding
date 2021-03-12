require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper

class EbirdController < ApplicationController
  include EbirdHelper
  def data
      lat = params[:lat]
      lng = params[:lng]
      rare = params[:rare] || false
      num_req = params[:num_req] || 100
      selected_bird = getBirdData(lat, lng, num_req, num_ret=1, rare).first
      img_src = getImageSrc(selected_bird)
      render :json => {'imgsrc':img_src,'birddata':selected_bird}
  end
end
