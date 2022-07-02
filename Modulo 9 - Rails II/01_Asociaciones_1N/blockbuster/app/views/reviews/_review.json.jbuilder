json.extract! review, :id, :content, :movie_id, :created_at, :updated_at
json.url review_url(review, format: :json)
