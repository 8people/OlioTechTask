# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    identifier = params[:session][:input]&.downcase
    user = sign_in_by(identifier)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:likes] = []
      flash[:notice] = 'Logged in successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was something wrong with your login details'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end

  private

  def sign_in_by(identifier)
    User.find_by(email: identifier) || User.find_by(name: identifier)
  end
end
