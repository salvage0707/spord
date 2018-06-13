class Users::BoardUsersController < ApplicationController
	before_action :set_board
  before_action :set_user
  def show
  end

  def index
  end

  def new
    # 申請済みだった場合にリダイレクト
    if @user.board_users.find_by(board_id: @board.id)
      redirect_to edit_board_board_users_path(@board.id) and return
    end
  	@request = @user.board_users.build
  end

  def create
		@request = @user.board_users.build(board_user_params)
    # 保存の確認
		if @request.save
			redirect_to board_path(@board.id) and return
		else
			render :new
		end
  end

  def edit
    # 募集にリクエストが通っているか確認
    @request = @user.board_users.find_by(board_id: @board.id)
    if @request.approval == false
    else
      redirect_to board_path(@board.id)
    end
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
        return
  		end
  	end

      def set_user
    @user = User.find_by(id: current_user.id)
  end

  	def board_user_params
  		params.require(:board_user).permit(:comment).merge(board_id: @board.id)
  	end

end
