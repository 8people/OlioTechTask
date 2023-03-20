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
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def like_article
    liked_articles = current_user.liked_articles || []
    liked_articles << params[:id]
    current_user.update(liked_articles: liked_articles)
    current_user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :liked_articles)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
