require 'rails_helper'
require 'vcr'

RSpec.describe "Ebirds", type: :request do
  it "given coords, it returns an image for a nearby bird" do
    VCR.use_cassette('ebird/get_image_from_name') do
      VCR.use_cassette('ebird/get_bird_from_cords') do

        get "/ebird/birds", :params => { :lat => 37.42, :lng => -121.91, :radius => 25}
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.parsed_body().first[:img]).to eq(nil)

      end
    end


    #expect(response.content_type).to eq("application/json")

    end
  it "Returns all images" do
      VCR.use_cassette("locations/fixed_ip") do
        loc = Location.find_or_initialize_by(name: "Example Location")
        loc.update(description: "Lorem Ipsum Dolor Dot", latitude:"37.8716", longitude:"-122.2728", short_desc:"Lorem Ipsdum Dolor Dot", picURL:"www.google.com")
        loc.save
        get "/ebird/locations", params: {}, headers: { "REMOTE_ADDR": "67.170.238.57" }
        #Can't figure out how to match the updated date correctly.
        #expect(response.body).to eq("[{\"id\":1,\"name\":\"Example Location\",\"website\":null,\"description\":\"Lorem Ipsum Dolor Dot\",...,\"updated_at\":\"2022-05-02T21:47:38.493Z\",\"latitude\":\"37.8716\",\"longitude\":\"-122.2728\"}]")
        #expect(response.body).to match(/\b\d\.\d+ mi\b/)
      end
  end
  it "given coords, it returns a hotspot" do
    VCR.use_cassette('ebird/getHotspotData') do
      get "/ebird/hotspots", :params => { :lat => 37.42, :lng => -121.91, :radius => 25}
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
  it "given scientific and common name, it returns a bird" do
    VCR.use_cassette('ebird/getBirdData') do
      VCR.use_cassette('ebird/getImageSrc') do
        get "/ebird/bird", :params => { :sci => "Hello", :com => "Doesn't exist", :radius => 25}
        expect(response.content_type).to eq("application/json; charset=utf-8")

      end
    end
  end
end
