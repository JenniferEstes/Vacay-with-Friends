class GoalsController < ApplicationController

    def index 
    @goals = current_user.goals
    end

    def new
        @goal = Goal.new
    end 

    def create
        @goal = current_user.goals.build(goal_params)
        if @goal.save
            redirect_to goals_path
        else
            render :new
        end 

    def show
        @goal = Goal.find_by(id: params[:id])
    end 

    # def edit
    #     end

    def update
        @goal.update(goal_params)
        redirect_to goal_vacation_path(@goal)
    end 
    
    def destroy
        @goal.destroy
        flash[:notice] = "Goal deleted."
        redirect_to goals_path
    end 

    private 
    def goal_params
        params.require(:goal).permit(:amount, vacation_attributes:[:id, :location, :description, :date_traveled, :completed, :user_id, :goal_id])
    end
end
