class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in'
      redirect_to user_path(user)
    else
      flash.now[:alert] = 'There was something wrong with your login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out'
    redirect_to login_path
  end
end
