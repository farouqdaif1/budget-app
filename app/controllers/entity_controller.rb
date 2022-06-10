class EntityController < ApplicationController
  def index
    @category = Group.find(params[:group_id])
    @entities = @category.entities
  end

  def new
    @new_entity = Entity.new
  end

  def create
    @category = Group.find(params[:group_id])
    @new_entity = @category.entities.new(name: entity_params[:name],
                                         amount: entity_params[:amount], user_id: current_user.id)
    if @new_entity.save
      flash[:notice] = 'Transaction is completed'
      redirect_to group_entity_index_path
    else
      render :new
      flash[:notice] = 'Invalid Transaction!'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id, :group_id)
  end
end
