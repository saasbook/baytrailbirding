require 'rails_helper'

RSpec.describe "Application", type: :request do
  describe "GET /locations" do
    it "should use request IP" do
      VCR.use_cassette("locations/fixed_ip") do
        loc = Location.find_or_initialize_by(name: "Example Location")
        loc.update(description: "Lorem Ipsum Dolor Dot", latitude:"37.8716", longitude:"-122.2728", short_desc:"Lorem Ipsdum Dolor Dot", picURL:"www.google.com")
        loc.save
        get "/locations", params: {}, headers: { "REMOTE_ADDR": "67.170.238.57" }
        expect(response.body).to match(/\b\d\.\d+ mi\b/)
      end
    end
  end
end
