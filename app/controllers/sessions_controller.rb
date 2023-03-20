# frozen_string_literal: true

class SessionsController < ApplicationController::Base
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to user
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

  def sign_in_by
    User.find_by(email: params[:session][:email].downcase) || User.find_by(name: params[:session][:name])
  end
end
