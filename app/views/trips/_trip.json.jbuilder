json.extract! trip, :id, :city, :state, :country, :longitude, :latitude, :zipcode, :created_at, :updated_at
json.url group_trip_url(trip.group, trip, format: :json)
