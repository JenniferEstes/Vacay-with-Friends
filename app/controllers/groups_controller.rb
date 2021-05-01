class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      @group.users << current_user
      redirect_to groups_path
    else
      flash[:notice] = "Sorry, try again."
      render :new
    end
  end

  def show
    @group = Group.find_by_id(params[:id])
    redirect_to root_path unless @group.users.include? current_user
  end

  # def edit
  # end
  #
   private
      def group_params
          params.require(:group).permit(:name)
      end
end
