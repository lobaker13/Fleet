class Trip < ApplicationRecord
	belongs_to :group
	has_many :trip_comments
	def address
    	[city, state, country].compact.join(', ')
  	end
	geocoded_by :address
	after_validation :geocode
end
