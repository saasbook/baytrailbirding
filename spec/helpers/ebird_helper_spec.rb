require 'rails_helper'
require 'vcr'

# Specs in this file have access to a helper object that includes
# the EbirdHelper. For example:
#
# describe EbirdHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EbirdHelper, type: :helper do

  it "given coords, it returns a nearby bird" do
      VCR.use_cassette('ebird/get_bird_from_cords') do
        lat = 37.42
        lng = -121.91
        bird = getBirdData(lat,lng,1,1).first;
        expect(haversine_distance([lat,lng],[bird["lat"],bird["lng"]],true)).to be <= 25

      end
    end

end
RSpec.describe EbirdHelper, type: :helper do

  it "given name, it returns an image" do
      VCR.use_cassette('ebird/get_image_from_name') do
        name = "Canada Goose"
        image = getImageFromName(name);
        expect(image).to eq "https://upload.wikimedia.org/wikipedia/commons/4/40/Canada_goose_on_Seedskadee_NWR_%2827826185489%29.jpg"

      end
    end

end
