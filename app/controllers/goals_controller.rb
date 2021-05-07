class GoalsController < ApplicationController
#
    def index
        redirect_if_not_logged_in
        if @vacation = Vacation.find_by_id(params[:vacation_id])
            redirect_if_not_authorized(@vacation.group)
            @goals = @vacation.goals
        end
    end

    def new
        redirect_if_not_logged_in
        if @vacation = Vacation.find_by_id(params[:vacation_id])
            @goal = Goal.new
        else
            flash[:notice] = "Goal doesn't exist!"
            redirect_to group_vacations_path
        end
    end

    def create
        if @vacation = Vacation.find_by_id(params[:vacation_id])
            @goal = @vacation.goals.build(goal_params)
            @goal.user = current_user
            if @goal.save
                redirect_to vacation_goal_path(@vacation, @goal)
            else
                render :new
            end
        end
    end

    def show
        redirect_if_not_logged_in
        find_goal
        redirect_if_not_authorized(@goal.vacation.group)
    end

    def edit
        redirect_if_not_logged_in
        find_goal
        redirect_if_not_authorized(@goal.vacation.group)
    end

    def update
        redirect_if_not_logged_in
        find_goal
        #makes sure goal belongs to specific user
        # redirect_to root_path unless @goal.user == current_user
        redirect_if_not_authorized(@goal.vacation.group)
        if @goal.update(goal_params)
            redirect_to vacation_goals_path(@goal.vacation)
        else
            render :edit
        end
    end

    def destroy
        redirect_if_not_logged_in
        find_goal
        v = @goal.vacation
        redirect_if_not_authorized(v.group)
        @goal.destroy
        flash[:notice] = "Your goal has been deleted."
        redirect_to vacation_goals_path(v)
    end

    private
    def goal_params
        params.require(:goal).permit(:amount, :vacation_id, :user_id)
    end

    def find_goal
        @goal = Goal.find_by_id(params[:id])
    end
end
