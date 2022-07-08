json.extract! reservation, :id, :date, :table, :client_id, :restaurant_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
