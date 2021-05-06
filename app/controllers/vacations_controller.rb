class VacationsController < ApplicationController
    def index
        redirect_if_not_logged_in
        if @group = Group.find_by_id(params[:group_id])
            redirect_if_not_authorized(@group)
            @vacations = Vacation.most_recent(@group)
        else
            flash[:notice] = "That group doesn't exist!"
            redirect_to groups_path
        end
    end

    def new
        redirect_if_not_logged_in
        if @group = Group.find_by_id(params[:group_id])
            @vacation = Vacation.new
        else
            flash[:notice] = "That group doesn't exist!"
            redirect_to groups_path
        end
    end

    def create
        if @group = Group.find_by_id(params[:group_id])
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
        redirect_if_not_logged_in
        find_vacation
        redirect_if_not_authorized(@vacation.group)
    end

    def edit
        redirect_if_not_logged_in
        find_vacation
        redirect_if_not_authorized(@vacation.group)
    end

    def update
        redirect_if_not_logged_in
        find_vacation
        redirect_if_not_authorized(@vacation.group)
        if @vacation.update(vacation_params)
            redirect_to group_vacations_path(@vacation.group)
        else
            flash[:alert] = "You typed something incorrectly. Please try again."
            render :edit
        end
    end


    private
    def vacation_params
        params.require(:vacation).permit(:date_traveling, :description)
    end

    def find_vacation
        @vacation = Vacation.find_by_id(params[:id])
    end
end
