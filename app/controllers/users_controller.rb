class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.password = auth['uid']
    end
 
    session[:user_id] = @user.id
 
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params 
    params.require(:user).permit(:username, :password)
  end

  def auth
    request.env['omniauth.auth']
  end
end
