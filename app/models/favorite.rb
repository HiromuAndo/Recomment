class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :review

	scope :pub, -> {
	joins(:review).merge(Review.pub)
	 }
end
