json.extract! story, :id, :title, :picture, :content, :user_id, :created_at, :updated_at
json.url story_url(story, format: :json)
