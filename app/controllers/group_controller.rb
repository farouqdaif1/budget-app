class GroupController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups.includes(:entities)
  end

  def new
    @new_group = Group.new
  end

  def create
    @new_group = current_user.groups.new(group_params)
    if @new_group.save
      flash[:notice] = 'You have successfully created a new category.'
      redirect_to group_index_path, notice: 'Category created successfully'
    else
      render :new
      flash[:notice] = 'Invalid Category'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
