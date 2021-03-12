require 'rails_helper'
require 'vcr'

RSpec.describe "Ebirds", type: :request do
  it "given coords, it returns an image for a nearby bird" do
    VCR.use_cassette('ebird/get_image_from_name') do
      VCR.use_cassette('ebird/get_bird_from_cords') do

        post "/ebird", :params => { :lat => 37.42, :lng => -121.91, :rare => false, :num_req => 1, :num_ret => 1}
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.parsed_body()["imgsrc"].first).to eq("https://upload.wikimedia.org/wikipedia/commons/4/40/Canada_goose_on_Seedskadee_NWR_%2827826185489%29.jpg")

      end
    end


    #expect(response.content_type).to eq("application/json")

    end
end
