class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users
	has_many :admin_panels
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

end
