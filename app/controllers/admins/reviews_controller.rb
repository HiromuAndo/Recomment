class Admins::ReviewsController < ApplicationController
before_action :authenticate_admin!
  def index
  	 #検索オブジェクト
    if params[:q]
      @search = Review.ransack(params[:q])
      #検索結果
      @reviews = @search.result.page(params[:page]).reverse_order
    # タグ絞り込み
    elsif params[:tag]
      @search = Review.ransack(params[:q])
      @reviews = Review.tagged_with(params[:tag]).page(params[:page]).reverse_order
    else
      @search = Review.ransack(params[:q])
      @reviews = Review.page(params[:page]).reverse_order
    end
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	@review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admins_user_path(@review.user_id)
    else
      render :edit
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
    @review.destroy
    redirect_to admins_reviews_path
  end

  private
  def review_params
  	params.require(:review).permit(:body, :open, :spoiler, :tag_list, :category_id)
  end
end
