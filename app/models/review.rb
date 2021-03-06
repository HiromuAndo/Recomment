class Review < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :favorites, dependent: :destroy
	validates :body, presence: true
	validates :category_id, presence: true
	validates :open, inclusion: { in: [true, false] }
	validates :spoiler, inclusion: { in: [true, false] }
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	# openカラムがtrueであるものを取得する
	scope :pub, -> { where(open: true) }

	acts_as_taggable
end
