class CreatePositionScene2s < ActiveRecord::Migration
  def change
    create_table :position_scene2s do |t|
      t.string :file_name
      t.decimal :vertices_number
      t.decimal :space_ratio
      t.decimal :position_difference
      t.decimal :colour_difference
      t.decimal :scene_score
      t.integer :admin_panel_id
      t.integer :user_panel_id

      t.timestamps null: false
    end
  end
end
