class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :comment

	# :destroy allows to delete rows in comment table
	# has_many :comments, dependent: :destroy
end
