class VacationsController < ApplicationController
    def index
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            redirect_to root_path unless @group.users.include? current_user
            @vacations = @group.vacations
        else
            flash[:notice] = "That group doesn't exist!"
            redirect_to groups_path
        end
    end

    def new
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @vacation = Vacation.new
        else
            flash[:notice] = "That group doesn't exist!"
            redirect_to groups_path
        end
    end

    def create
        if params[:group_id] && @group = Group.find_by_id(params[:group_id])
            @vacation = @group.vacations.build(vacation_params)
            if @vacation.save
                redirect_to group_vacation_path(@group, @vacation)
            else
                flash[:notice] = "Sorry, try again."
                render :new
            end
        else
            flash[:notice] = "That group doesn't exist!"
            redirect_to groups_path
        end
    end

    def show
        @vacation = Vacation.find_by_id(params[:id])
        redirect_to root_path unless @vacation.group.users.include? current_user
    end

    def edit
        @vacation = Vacation.find_by_id(params[:id])
        redirect_to root_path unless @vacation.group.users.include? current_user
    end

    def update
        @vacation = Vacation.find_by_id(params[:id])
        redirect_to root_path unless @vacation.group.users.include? current_user
        if @vacation.update(vacation_params)
            redirect_to group_vacations_path(@vacation.group)
        else
            render :edit
        end
    end


    private
    def vacation_params
        params.require(:vacation).permit(:date_traveling, :description)
    end
end
