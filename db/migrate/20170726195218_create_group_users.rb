class CreateGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
