json.extract! movie, :id, :title, :duration, :category, :created_at, :updated_at
json.url movie_url(movie, format: :json)
