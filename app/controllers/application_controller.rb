# frozen_string_literal: true

# Handles rendering pages that do not use the Ebird API
class ApplicationController < ActionController::Base
  include EbirdHelper

  def show
    calc_location
    @locations_full = Location.all.sort_by do |location|
      hav_distance([location.latitude.to_f, location.longitude.to_f], @current_location)
    end
  end

  def calc_location
    @current_location = [37.8039, -122.2591]

    return unless IPAddress.valid?(request.remote_ip) && (request.remote_ip != '127.0.0.1')

    user_ip = request.remote_ip
    results = Geocoder.search(user_ip)
    @current_location = results.first.coordinates if results.first.coordinates&.any?
  end
end
