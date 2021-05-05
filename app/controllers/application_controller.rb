class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Can use in views
  helper_method :current_user, :logged_in?

  def current_user
    @current_user || User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect_to root_path if @user != current_user
  end
end
