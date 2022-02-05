class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :subscriber
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
