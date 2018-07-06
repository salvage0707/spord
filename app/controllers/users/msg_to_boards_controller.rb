class Users::MsgToBoardsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
  def index
		@message = MsgToBoard.new
		@board = Board.find_by(id: params[:board_id])
  end

	def create
		@message = @user.msg_to_board.new(message_params)
		if @message.save
			redirect_to board_message_path(params[:board_id])
		else
			@board = Board.find(params[:board_id])
			render :index
		end
	end

	private

		def message_params
			params.require(:msg_to_board).permit(:message).merge(board_id: params[:board_id])
		end

end
