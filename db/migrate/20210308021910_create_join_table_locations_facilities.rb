# frozen_string_literal: true

# Create the join table between locations and facilities
class CreateJoinTableLocationsFacilities < ActiveRecord::Migration[6.1]
  def change
    create_join_table :locations, :facilities do |t|
      t.index %i[location_id facility_id]
    end
  end
end
