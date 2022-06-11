class EntityController < ApplicationController
  def index
    @category = Group.find(params[:group_id])
    @entities = Entity.order(created_at: :desc).where(group_id: params[:group_id])
  end

  def new
    @new_entity = Entity.new
  end

  def create
    # @category = Group.find(params[:group_id])
    @new_entity = Entity.new(entity_params)
    @new_entity.user_id = current_user.id

    if @new_entity.save
      flash[:notice] = 'Transaction is completed'
      redirect_to group_entity_index_path(@new_entity.group_id)
    else
      render :new
      flash[:notice] = 'Invalid Transaction!'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id, :user_id)
  end
end
