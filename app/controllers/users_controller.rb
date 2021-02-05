class UsersController < ApplicationController

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
    # POST /users
    user = User.create!(
      firstname: params[:firstname],
      lastname: params[:lastname],
      email: params[:email],
      password: params[:password],
    )
    redirect_to root_path
  end

  def login
    user = User.find_by(
      email: params[:email],
      password: params[:password],
    )
    response_text = (user ? "true" : "false")
    render plain: response_text
  end
end
