# frozen_string_literal: true

# Add latitude information to location
class AddLatitudeToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :latitude, :string
  end
end
