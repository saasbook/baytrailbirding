require 'net/http'
require 'json'
include ActionView::Helpers::NumberHelper

class EbirdController < ApplicationController
  include EbirdHelper
  def data
      lat = params[:lat]
      lng = params[:lng]
      rare = params[:rare]
      selected_bird = getBirdData(lat, lng, num_req=100, num_ret=1, rare=rare).first
      img_src = getImageSrc(selected_bird)
      render :json => {'imgsrc':img_src,'birddata':selected_bird}
  end
end
