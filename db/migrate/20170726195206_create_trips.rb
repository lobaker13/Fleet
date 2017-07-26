class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :city
      t.string :state
      t.string :country
      t.float :longitude
      t.float :latitude
      t.integer :zipcode

      t.timestamps
    end
  end
end
