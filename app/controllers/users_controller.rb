class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).
             map(&:to_pleasant_string).
             join("\n")
  end

  def show
      user = User.find_by(id: params[:id])
      render plain: (user ? user.to_pleasant_string : "User Not Found")
  end

  def create
    new_user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    response_text = "User '#{new_user.name}' created with ID: #{new_user.id}"
    render plain: response_text
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
