class SessionsController < ApplicationController

  def index
    render 'welcome'
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Sorry, that did not work. Please try again!"
      redirect_to login_path
    end
  end

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.password = auth['info']['password']
    end
 
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy 
    session.clear
    redirect_to root_path
  end

  private 

  def auth
    request.env['omniauth.auth']
  end

end