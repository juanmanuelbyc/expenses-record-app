# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :set_user

  def index
    @groups = @user.groups
    @group = @groups.find(params[:group_id])
    @entities = @group.entities
  end
  def new
    @groups = @user.groups
    @group = @groups.find(params[:group_id])
    @entity = Entity.new
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = @user.entities.new(entity_params)

    return unless @entity.save

    redirect_to group_entities_path(@group)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end

  def set_user
    @user = current_user
  end
end
