class Scene3 < ActiveRecord::Base
	has_many :user_panels
	belongs_to :user_panel
	belongs_to :admin_panel 
end