class UsersController < ApplicationController
  # Has guest access
  skip_before_action :require_login

  def index
    # GET /users
    render plain: User.order(:firstname).
             map(&:to_pleasant_string).
             join("\n")
  end

  def show
    user = User.find_by(id: params[:id])
    render plain: (user ? user.to_pleasant_string : "User Not Found")
  end

  def new
    # GET /users/new
    render "new"
  end

  def create
    # POST /users - SIGNUP
    user = User.create!(
      firstname: params[:firstname],
      lastname: params[:lastname],
      email: params[:email],
      password: params[:password],
    )
    # Login user upon successful signup
    if (user)
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      redirect_to root_path
    end
  end
end
