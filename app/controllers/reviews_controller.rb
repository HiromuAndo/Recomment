class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  	 redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def index
    #検索オブジェクト
    if params[:q]
      @search = Review.ransack(params[:q])
      #検索結果
      @reviews = @search.result(distinct: true).pub.page(params[:page]).reverse_order
    # タグ絞り込み
    elsif params[:tag]
      @search = Review.ransack(params[:q])
      @reviews = Review.tagged_with(params[:tag]).pub.page(params[:page]).reverse_order
    else
      @search = Review.ransack(params[:q])
      @reviews = Review.pub.page(params[:page]).reverse_order
    end

  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(current_user.id)
  end

  def howtouse
    
  end

  private
  def review_params
  	params.require(:review).permit(:body, :open, :spoiler, :tag_list, :category_id)
  end
end