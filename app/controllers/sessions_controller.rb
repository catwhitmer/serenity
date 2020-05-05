class SessionsController < ApplicationController

  def index
    render 'welcome'
  end

  def new
    @user = User.find_by(username: params[:username])
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Sorry, that did not work. Please try again!"
      redirect_to login_path
    end
  end

  def destroy 
    session.clear
    redirect_to root_path
  end

end