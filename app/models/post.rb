class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :user, :image, presence: true
end
