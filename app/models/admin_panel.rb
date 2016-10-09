class AdminPanel < ActiveRecord::Base
	belongs_to :admin
	has_many :user_panels, dependent: :destroy
	has_many :scene1s, dependent: :destroy
	has_many :scene2s, dependent: :destroy
	has_many :scene3s, dependent: :destroy
end
