class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Login information incorrect."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
