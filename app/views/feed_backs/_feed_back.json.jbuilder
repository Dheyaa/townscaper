json.extract! feed_back, :id, :title, :body, :user_panel_id, :created_at, :updated_at
json.url feed_back_url(feed_back, format: :json)