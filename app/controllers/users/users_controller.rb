class Users::UsersController < ApplicationController
	before_action :set_user, only: [:show]
  def show
  	@this_user = User.find_by(id: params[:id])
  	@boards = @this_user.joining_boards
  	@communities = @this_user.community_users.where(approval: true)
  end

  def destroy
  end

  def index
  end
end
