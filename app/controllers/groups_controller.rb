class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    find_group
    redirect_if_not_authorized(@group)
  end

  def edit
    redirect_if_not_logged_in
    find_group
    redirect_if_not_authorized(@group)
  end

  def update
    redirect_if_not_logged_in
    find_group
    redirect_if_not_authorized(@group)
    if @group.update(group_params)
      redirect_to groups_path(@group)
    else
      render :edit
    end
  end

  def destroy
    redirect_if_not_logged_in
    find_group
    redirect_if_not_authorized(@group)
    @group.destroy
    flash[:notice] = "Group has been deleted."
    redirect_to groups_path
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end

  def find_group
    @group = Group.find_by_id(params[:id])
  end
end
