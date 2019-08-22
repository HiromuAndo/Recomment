class FavoritesController < ApplicationController
	def create
		@review = Review.find(params[:review_id])
		favorite = current_user.favorites.build(review_id: @review.id, user_id: current_user.id)
		favorite.save
	end

	def destroy
		@review = Review.find(params[:review_id])
		favorite = current_user.favorites.find_by(review_id: @review.id, user_id: current_user.id)
		favorite.destroy
	end
end
