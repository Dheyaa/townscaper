class FeedBack < ActiveRecord::Base
	belongs_to :user_panel
	validates :title, presence: { message: " is empty, please fill a title for your feedback" }
	validates :body, presence: { message: " of feedback is empty, please fill a message for your feedback" }
end
