class Itinerary < ApplicationRecord
  belongs_to :trip
  attr_accessor :date_range
end
