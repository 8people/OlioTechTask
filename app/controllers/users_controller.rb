# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'New sign up successfully created!'
      redirect_to login_url
    else
      render 'new'
    end
  end

  def liked
    user = User.find(session[:user_id])
    article_list = user&.liked_articles || []
    article_list << params[:id]
    user.update(liked_articles: article_list)
    user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :liked_articles)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
