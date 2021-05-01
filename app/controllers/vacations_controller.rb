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
            redirect_to vacations_path
        else
            flash[:notice] = "Sorry, try again."
            render :new
        end
    end

#     def show
#         @vacation = Vacation.find_by_id(params[:id])
#         redirect_to root_path if !@user
#     end
#
    private
    def vacation_params
        params.require(:vacation).permit(:date_traveling, :description)
    end
end
