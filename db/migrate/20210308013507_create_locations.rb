class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :website
      t.text :description
      t.string :picURL
      t.string :websiteURL
      t.text :short_desc

      t.timestamps
    end
  end
end
