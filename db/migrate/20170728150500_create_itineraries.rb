class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.string :title
      t.text :description
      t.belongs_to :trip
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
