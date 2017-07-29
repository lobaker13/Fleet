json.array!(@itineraries) do |itinerary|
  json.extract! itinerary, :id, :title, :description
  json.start itinerary.start_time
  json.end itinerary.end_time
  json.url group_trip_itineraries_url(itinerary, format: :html)
end
