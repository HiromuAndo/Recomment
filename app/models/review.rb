class Review < ApplicationRecord
	belongs_to :user
	belongs_to :category

	acts_as_taggable
end
