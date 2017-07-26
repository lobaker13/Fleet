class CreateGroupComments < ActiveRecord::Migration[5.1]
  def change
    create_table :group_comments do |t|
      t.text :body
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
