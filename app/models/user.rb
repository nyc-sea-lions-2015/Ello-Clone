class User < ActiveRecord::Base
	has_many :comments
	has_many :posts
	has_many :followers, :class_name => 'Followings', :foreign_key => 'user_id'
	has_many :following, :class_name => 'Followings', :foreign_key => 'follower_id' 

	has_secure_password
end
