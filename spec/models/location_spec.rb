require 'rails_helper'

RSpec.describe Location, :type => :model do
  it "is valid with valid attributes" do
  	new_site = Site.new(name: "Example Location", description: "Lorem Ipsum Dolor Dot")
  	expect(new_site).to be_valid
  end

  it "is not valid without a name" do
  	new_site = Site.new(description: "Lorem Ipsum Dolor Dot")
  	expect(new_site).to_not be_valid
  end

  it "is not valid without a description" do
  	new_site = Site.new(name: "Example Location")
  	expect(new_site).to_not be_valid
  end
end