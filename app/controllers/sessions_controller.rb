class SessionsController < ApplicationController

    def new
        render "new"
    end

    def create
        user = User.find_by(email: params[:email])
        if(user && user.authenticate(params[:password]))
            @current_user = user
        end
        redirect_to root_path
    end

end
