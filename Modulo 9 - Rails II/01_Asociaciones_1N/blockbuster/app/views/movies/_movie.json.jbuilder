json.extract! movie, :id, :title, :duration, :category_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
