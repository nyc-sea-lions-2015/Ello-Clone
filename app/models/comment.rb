class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

  ## Good use of model validations
	validates :content, :user, :post, presence: true
end
