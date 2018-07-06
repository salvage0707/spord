class Users::MsgToUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
  def index
		@message = MsgToUser.new
		@this_user = User.find_by(id: params[:user_id])
  end

	def create
		@message = @user.msg_to_users.new(message_params)
		if @message.save
			redirect_to user_message_path(params[:user_id])
		else
			@this_user = User.find(params[:user_id])
			render :index
		end
	end

	private

		def message_params
			params.require(:msg_to_user).permit(:message).merge(to_user_id: params[:user_id])
		end

end
