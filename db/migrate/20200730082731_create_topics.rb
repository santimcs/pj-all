class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
