# frozen_string_literal: true

# Add longitude information to location
class AddLongitudeToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :longitude, :string
  end
end
