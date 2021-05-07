class UsersController < ApplicationController

    def new
        if !logged_in?
            @user = User.new
        else
            redirect_to root_path
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = "One or more fields has letters or characters that were not expected. Please ensure you are only entering details we are asking for."
            render :new 
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_if_not_logged_in
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
