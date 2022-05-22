# frozen_string_literal: true

require 'rails_helper'
require 'vcr'

RSpec.describe 'Ebirds', type: :request do
  it 'given coords, it returns nearby birds' do
    VCR.use_cassette('ebird/get_bird_from_cords') do
      get '/ebird/birds', params: { lat: 37.42, lng: -121.91, radius: 25 }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  it 'given coords, it returns nearby hotspots' do
    VCR.use_cassette('ebird/get_hotspot_from_coords') do
      get '/ebird/hotspots', params: { lat: 37.42, lng: -121.91, radius: 25 }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  it 'given hotspot, it returns the birds for that hotspot' do
    VCR.use_cassette('ebird/get_birds_from_hotspot') do
      get '/ebird/birds', params: { hotspot: 'L6530472' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  it 'given bird common and scientific name, it returns the bird image' do
    VCR.use_cassette('ebird/get_image_from_name') do
      get '/ebird/bird', params: { com: 'Canada Goose', sci: 'Branta canadensis' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
