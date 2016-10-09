json.extract! admin_panel, :id, :project_name, :admin_id, :created_at, :updated_at
json.url admin_panel_url(admin_panel, format: :json)