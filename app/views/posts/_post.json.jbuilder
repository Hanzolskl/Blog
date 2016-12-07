json.extract! post, :id, :title, :body, :User_id, :created_at, :updated_at
json.url post_url(post, format: :json)