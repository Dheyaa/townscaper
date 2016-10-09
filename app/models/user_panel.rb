class UserPanel < ActiveRecord::Base
	belongs_to :user
	belongs_to :admin_panel
	belongs_to :scene
	belongs_to :scene1
	belongs_to :scene2
	belongs_to :scene3
	has_many :scene1s
	has_many :scene2s
	has_many :scene3s
	has_many :nowscenes
	has_one :feed_back
	validates :consent, :acceptance => {:accept => true} 
	validates :age_group, presence: { message: "field is empty, please choose an age group" }
	validates_inclusion_of :art_related, in: [true, false] #to validate boolean attribute
	validates :gender, presence: { message: "field is empty, please choose a gender" }
	validates :education_level, presence: { message: "field is empty, please choose education level" }
end
