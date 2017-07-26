json.extract! trip_comment, :id, :body, :user_id, :trip_id, :created_at, :updated_at
json.url trip_comment_url(trip_comment, format: :json)
