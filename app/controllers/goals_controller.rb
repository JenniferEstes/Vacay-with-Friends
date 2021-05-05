class GoalsController < ApplicationController
#
    def index
        redirect_if_not_logged_in
        if params[:vacation_id] && @vacation = Vacation.find_by_id(params[:vacation_id])
            redirect_if_not_authorized(vacation)
            @goals = @vacation.goals
        end
    end

    def new
        redirect_if_not_logged_in
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
        redirect_if_not_logged_in
        find_goal
        redirect_if_not_authorized(vacation)
    end

    def edit
        find_goal
        redirect_if_not_authorized(vacation)
    end

    def update
        redirect_if_not_logged_in
        find_goal
        redirect_to root_path unless @goal.user == current_user
        if @goal.update(goal_params)
            redirect_to vacation_goals_path(@goal.vacation)
        else
            flash[:alert] = "Your goal must be a number."
            render :edit
        end
    end

    def destroy
        redirect_if_not_logged_in
        redirect_if_not_authorized(vacation)
        @goal.destroy
        flash[:notice] = "Goal deleted."
        redirect_to goals_path
    end

    private
    def goal_params
        params.require(:goal).permit(:amount, :vacation_id, :user_id)
    end

    def redirect_if_not_authorized(vacation)
        redirect_to root_path unless @vacation.group.users.include? current_user
    end

    def find_goal
        @goal = Goal.find_by_id(params[:id])
    end
end
