class VacationsController < ApplicationController
    def new
        @vacation =  Vacation.new
    end

    def create
        @vacation = current_user.vacation.build(vacation_params)
        if @vacation.save
            redirect_to @vacations_path
        else
            render :new 
        end
    end

    private
    def vacation_params
        params.require(:vacation).permit(:date_traveling, :description)
    end
end
