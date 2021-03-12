class Facility < ApplicationRecord
  validates :name, :icon, presence: true
  validates :name, uniqueness: true

  has_many :location_facilities
  has_many :locations, through: :location_facilities
end
