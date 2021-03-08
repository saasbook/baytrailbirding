class Location < ApplicationRecord
	validates_presence_of :name
	validates_presence_of :description
	validates_presence_of :longitude
	validates_presence_of :latitude

        has_many :location_facilities
        has_many :facilities, through: :location_facilities
end
