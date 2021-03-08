require 'rails_helper'

RSpec.describe Facility, :type => :model do
  subject {
    described_class.new(name: "Example Facility", icon: "/img/icon.jpg")
  }

  describe "Model Validations" do
    it "is valid with all required attributes" do
    	expect(subject).to be_valid
    end

    it "is not valid without a name" do
    	subject.name = nil
    	expect(subject).to_not be_valid
    end

    it "is not valid without an icon" do
    	subject.icon = nil
    	expect(subject).to_not be_valid
    end

    it "has many locations" do
      should respond_to(:locations)
    end
  end
end
