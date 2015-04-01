class User < ActiveRecord::Base
	has_many :comments
	has_many :posts
	has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
	has_many :following, :class_name => 'Following', :foreign_key => 'follower_id' 

	has_secure_password

	validates :email, :password_digest, :user_name, presence: true
	validates :email, :user_name, uniqueness: true
end
