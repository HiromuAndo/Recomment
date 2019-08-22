class Review < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	acts_as_taggable
end
