class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
