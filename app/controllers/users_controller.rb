class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :unregister]
  def show
  	@user = User.find(params[:id])
    if @user == current_user
      @reviews = @user.reviews.page(params[:page]).reverse_order
    else
      @reviews = @user.reviews.pub.page(params[:page]).reverse_order
    end
    @favorites = @user.favorites.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def unregister
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
