class CreateJoinTableLocationsFacilities < ActiveRecord::Migration[6.1]
  def change
    create_join_table :locations, :facilities do |t|
      t.index [:location_id, :facility_id]
    end
  end
end
