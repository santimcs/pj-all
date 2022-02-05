class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.integer :total_episode, default: 999
      t.integer :finish_episode, default: 0
      t.boolean :completed, default: false
      t.integer :duration, default: 0
      t.string :image_url
      t.integer :views, default: 0
      t.date :last_updated
      t.integer :sequence, default: 9999
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
