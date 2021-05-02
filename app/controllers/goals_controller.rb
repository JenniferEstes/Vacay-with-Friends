class GoalsController < ApplicationController
#
    def index
        if params[:vacation_id] && @vacation = Vacation.find_by_id(params[:vacation_id])
            redirect_to root_path unless @vacation.group.users.include? current_user
            @goals = @vacation.goals
        end
    end

    def new
        if params[:vacation_id] && @vacation = Vacation.find_by_id(params[:vacation_id])
            @goal = Goal.new
        else
            flash[:notice] = "Goal doesn't exist!"
            redirect_to group_vacations_path
        end
    end

    def create
        if params[:vacation_id] && @vacation = Vacation.find_by_id(params[:vacation_id])
            @goal = @vacation.goals.build(goal_params)
            @goal.user = current_user
            if @goal.save
                redirect_to vacation_goal_path(@vacation, @goal)
            else
                flash[:notice] = "Sorry, try again."
                render :new
            end
        end
    end

    def show
        @goal = Goal.find_by_id(params[:id])
        redirect_to root_path unless @goal.vacation.group.users.include? current_user
    end

    def update
        @goal = Goal.find_by_id(params[:id])
        redirect_to root_path unless @goal.vacation.group.users.include? current_user
            render :edit
    end

    def destroy
        @goal.destroy
        flash[:notice] = "Goal deleted."
        redirect_to goals_path
    end

    private
    def goal_params
        params.require(:goal).permit(:amount)
    end
end
