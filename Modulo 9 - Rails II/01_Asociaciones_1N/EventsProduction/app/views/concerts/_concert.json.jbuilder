json.extract! concert, :id, :attendance, :date, :capacity, :group_id, :created_at, :updated_at
json.url concert_url(concert, format: :json)
