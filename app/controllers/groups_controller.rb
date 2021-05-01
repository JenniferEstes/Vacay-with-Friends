class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  # def create
  # end

  def show
    @group = Group.find_by_id(params[:id])
    redirect_to root_path unless @group.users.include? current_user
  end

  # def edit
  # end
  #
   private
      def vacation_params
          params.require(:group).permit(:name,)
      end
end
