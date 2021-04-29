class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    # def home
    # end

    def destroy
        session.clear
        redirect_to login_path
    end
    
    def new
        render :new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid information. Please try again."
            render :new
        end
    end

    #to get email - request.env['omniauth.auth'][:info][:email]
    def omniauth
        @user = User.find_or_create_by(email: auth[:user][:email]) do |u|
            u.email = auth[:user][:email]
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
