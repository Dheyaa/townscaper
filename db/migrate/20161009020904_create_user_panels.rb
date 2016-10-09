class CreateUserPanels < ActiveRecord::Migration
  def change
    create_table :user_panels do |t|
      t.boolean :consent
      t.boolean :feedback
      t.integer :user_id
      t.integer :admin_panel_id
      t.boolean :scenes_completed, :default => false
      t.boolean :tutorial_completed, :default => false
      t.boolean :scene_valid, :default => false
      t.string :age_group
      t.boolean :art_related
      t.string :gender
      t.string :education_level

      t.timestamps null: false
    end
  end
end
