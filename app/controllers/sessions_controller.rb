class SessionsController < ApplicationController
    # Has guest access
    skip_before_action :require_login

    def new
        render "new"
    end

    def create
        user = User.find_by(email: params[:email])
        if(user && user.authenticate(params[:password]))
            session[:current_user_id] = user.id
        end
        redirect_to todos_path
    end

end
