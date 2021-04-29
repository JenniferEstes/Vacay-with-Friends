class VacationsController < ApplicationController

    def index
        @vacations = Vacation.all
    end

    def new
        @vacation = Vacation.new
    end

    def create
        @vacation = current_user.vacations.build(vacation_params)
        if @vacation.save
            redirect_to user_vacation_path
        else
            flash[:message] = "Sorry, try again."
            render :new 
        end
    end

    private
    def vacation_params
        params.require(:vacation).permit(:date_traveling, :description)
    end
end
