json.extract! playlist, :id, :topic_id, :channel_id, :title, :url, :total_episode, :finish_episode, :completed, :duration, :image_url, :views, :last_updated, :sequence, :rating, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
