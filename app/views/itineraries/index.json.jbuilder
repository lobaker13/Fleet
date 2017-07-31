json.array!(@trip.itineraries) do |itinerary|
  json.extract! itinerary, :id, :title, :description, :color
  json.start itinerary.start_time
  json.end itinerary.end_time
  json.url group_trip_itinerary_path(@trip.group,@trip,itinerary,  format: :html)
end
