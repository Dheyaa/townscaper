class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :admin
  has_one :user_panel
  has_one :feed_back
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
