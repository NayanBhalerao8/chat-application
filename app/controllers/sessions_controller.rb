# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'you have successfuly loged in '
      redirect_to root_path

    else
      flash.now[:error] = 'please enter some valid information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success]= 'you have log out successfully'
    redirect_to login_path
end
end
