class CreateFeedBacks < ActiveRecord::Migration
  def change
    create_table :feed_backs do |t|
      t.string :title
      t.text :body
      t.integer :user_panel_id

      t.timestamps null: false
    end
  end
end
