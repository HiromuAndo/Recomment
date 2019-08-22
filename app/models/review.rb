class Review < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :favorites, dependent: :destroy
	validates :body, presence: true
	validates :category_id, presence: true
	validates :open, presence: true
	validates :spoiler, presence: true
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	acts_as_taggable
end
