json.extract! trip, :id, :city, :state, :country, :longitude, :latitude, :zipcode, :created_at, :updated_at
json.url trip_url(trip, format: :json)
