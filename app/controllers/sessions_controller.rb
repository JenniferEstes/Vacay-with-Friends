class SessionsController < ApplicationController
    # skip_before_action :verify_authenticity_token, only: :create

    # def home
    #     end
    # end

    def destroy
        session.clear
        redirect_to root_path
    end
    
    def new
        if logged_in?
            redirect user_path(user)
        end
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path, notice: "Invalid information. Please try again."
        end
    end

    #to get email - request.env['omniauth.auth'][:info][:email]
    def omniauth
        user = User.find_or_create_by(uid: auth[:uid], provider: auth[:provider][:provider]) do |u|
            u.email = auth[:user][:email]
            u.password = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect to user_path
        else
            flash[:message] = "Invalid input. Please try again."
            redirect_to login_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
