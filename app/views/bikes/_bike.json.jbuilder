json.extract! bike, :id, :bike_type, :description, :image_url, :cost_per_hour, :day_rate, :weekend_rate, :avail, :qty, :location, :created_at, :updated_at
json.url bike_url(bike, format: :json)
