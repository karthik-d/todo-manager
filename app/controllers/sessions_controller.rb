class SessionsController < ApplicationController
  # Has guest access
  skip_before_action :require_login

  def new
    # If already logged in, redirect to home page
    if current_user
      redirect_to root_path
    else
      render "new"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if (user && user.authenticate(params[:password]))
      session[:current_user_id] = user.id
      flash[:info] = Array("Signed in successfully!")
      redirect_to root_path
    else
      flash[:error] = Array("Incorrect email or password. Please retry!")
      redirect_to new_session_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    flash[:info] = Array("Signed out successfully!")
    redirect_to root_path
  end
end
