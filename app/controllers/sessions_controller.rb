class SessionsController < ApplicationController

    # def home
    # end

    def destroy
        session.clear
        redirect_to root_path
    end
    
    # def new
    # end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:message] = "Invalid login. Please try again."
            redirect_to login_path
        end
    end

    #to get email - request.env['omniauth.auth'][:info][:email]
    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:username]) do |u|
            u.email = auth[:info][:email]
            u.name = auth[:info][:name]
            u.username = auth[:info][:username]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(8)
        end
        if @user.valid?
            #keep logged in
            session[:user_id] = @user.id
            redirect to user_path
        else 
            flash[:message] = "Invalid input. Please try again."
            redirct_to login_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end
