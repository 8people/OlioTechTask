# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    refresh_data
    @current_articles = Article.all
  end

  def like
    liked_article = Article.find params[:id]
    liked_article.likes += 1
    liked_article.save
  end

  def user_like
    like
    session[:likes] << params[:id]
    # redirect_to liked_path(params)
    redirect_to root_path
  end

  private

  def refresh_data
    fresh_articles = ProductsHelper.list
    fresh_articles.map! { |article| { 'id': article['id'], 'title': article['title'] } }
    Article.upsert_all(fresh_articles, unique_by: :id)
  end
end
