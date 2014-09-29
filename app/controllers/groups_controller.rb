class GroupsController < ApplicationController
  def index
    render json: Group.all
  end

  def show
    group = Group.find(params[:id])
    render json: {
      users: group.users, contacts: group.contacts
    }
  end

  private
  def group_params
    params.require(:group).require(:name)
  end
end
