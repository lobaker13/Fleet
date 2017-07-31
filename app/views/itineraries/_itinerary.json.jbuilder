json.extract! itinerary, :id, :title, :description, :start_time, :end_time, :created_at, :updated_at
json.url group_trip_itineraries_url(itinerary, format: :json)
