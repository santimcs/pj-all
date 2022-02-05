json.extract! channel, :id, :name, :subscriber, :url, :image, :created_at, :updated_at
json.url channel_url(channel, format: :json)
