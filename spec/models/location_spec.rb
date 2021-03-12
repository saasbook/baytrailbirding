require 'rails_helper'

RSpec.describe Location, :type => :model do
  subject {
    described_class.new(name: "Example Location", description: "Lorem Ipsum Dolor Dot", latitude:"0.0", longitude:"0.0")
  }

  describe "Model Validations" do
    it "is valid with valid attributes" do
    	expect(subject).to be_valid
    end

    it "is not valid without a name" do
    	subject.name = nil
    	expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
    	subject.description = nil
    	expect(subject).to_not be_valid
    end

    it "is not valid without a latitude" do
      subject.latitude = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a longitude" do
      subject.longitude = nil
      expect(subject).to_not be_valid
    end

    it "has many facilities" do
      should respond_to(:facilities)
    end
  end
end
