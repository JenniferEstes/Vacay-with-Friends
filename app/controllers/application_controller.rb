class ApplicationController < ActionController::Base

    def create
        session[:username] = params[:username]
        redirect_to '/'

        def destroy
            session.delete :username
          end 
    end
    
end
