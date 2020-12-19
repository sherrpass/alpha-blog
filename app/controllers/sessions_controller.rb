class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params.require(:session).permit(:email))
    if @user && @user.authenticate(params.require(:session).permit(:password)[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully!"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Incorrect login information."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to root_path
  end
end