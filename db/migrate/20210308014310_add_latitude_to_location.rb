class AddLatitudeToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :latitude, :string
  end
end
