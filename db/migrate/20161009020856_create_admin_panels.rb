class CreateAdminPanels < ActiveRecord::Migration
  def change
    create_table :admin_panels do |t|
      t.string :project_name
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
