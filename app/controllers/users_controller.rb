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
    user = User.new(
      firstname: params[:firstname],
      lastname: params[:lastname],
      email: params[:email],
      password: params[:password],
    )
    # Login user upon successful signup
    # Run validations
    if (user.save)
      flash[:info] = Array("Created your space. Lets start managing your todos!")
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end
end
