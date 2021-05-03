class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:omniauth]

    # def home
    #     end
    # end

    def destroy
        session.clear
        redirect_to root_path
    end
    
    def new
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    #to get email - request.env['omniauth.auth'][:info][:email]
    def create
        if params[:provider] == 'github'
            @user = User.create_by_github_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:message] = "Invalid input. Please try again."
                redirect_to login_path
            end
        end
    end

    def omniauth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
