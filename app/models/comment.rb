class Comment < ActiveRecord::Base
	#belongs_to :like
	has_many :likes
	# has_many :users, through: :likes
	belongs_to :user
end
