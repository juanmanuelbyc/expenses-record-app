# top-level documentation comment
class GroupsController < ApplicationController
  before_action :set_user

  def index
    @groups = @user.groups
  end

  def show
    @group = Group.find(params[:id])
    @entities = []
    @group.entities.order(:id).each do |group_entity|
      @entities << group_entity
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end

  def set_user
    @user = current_user
  end
end
