class Group < ApplicationRecord
	has_many :group_comments
	has_many :trips
	has_many :group_users
	has_many :users, through: :group_users
end
