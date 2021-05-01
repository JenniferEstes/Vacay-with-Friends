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
            # @errors = @user.errors.full_messages
            flash[:alert] = "It looks like you entered incorrect infomration. Please try again."
            render :new 
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to root_path if !@user
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :group_name, :group_members)
    end
end
