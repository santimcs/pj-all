class Playlist < ApplicationRecord
  belongs_to :topic
  belongs_to :channel

  # default_scope { order('topic_id,sequence') }  
end
