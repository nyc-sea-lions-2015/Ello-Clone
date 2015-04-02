class Following < ActiveRecord::Base
	belongs_to :user

  ## Nice!
	belongs_to :follower, :class_name => 'User'

	validates :user_id, :follower_id, presence: true
end
