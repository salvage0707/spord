class Users::BoardUsersController < ApplicationController
	before_action :set_board
  def show
  end

  def index
  end

  def new
  	user = User.find(current_user.id)
  	@recest = user.board_users.build
  	# 申請済みだった場合にリダイレクト
  	redirect_to if user.board_users.find_by(board_id: @board.id)
  end

  def create
  	#   	user = User.find(current_user.id)
  	# # 申請済みだった場合にリダイレクト
  	# redirect_to if user.board_users.find_by(board_id: @board.id)
  	# 	recest = user.board_users.build()
  	# 	if recest.save
  	# 		redirect_to board_path(@board.id)
  	# 	else
  	# 		render :new
  	# 	end
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private

  	# 募集が存在していたら代入
  	def set_board
  		if @board = Board.find_by(id: params[:board_id])
  		else
  			redirect_to boards_path
  		end
  	end

  	def board_user_params
  		params.require(:board_user).permit(:comment).merge(board_id: @board.id)
  	end
end
