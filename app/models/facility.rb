class Facility < ApplicationRecord
  validates :name, :icon, presence: true
end
