json.extract! itinerary, :id, :title, :description, :color
json.start itinerary.start_time
json.end itinerary.end_time
json.url group_trip_itineraries_url(@trip.group,@trip,  format: :html)
