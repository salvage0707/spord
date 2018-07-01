class Users::BoardUsersController < ApplicationController
  before_action :authenticate_user!
	before_action :set_board
  before_action :set_user
  # 使用を制限
  before_action :only_manager, only: [:show, :index, :reject]



# 作成者側------------------------------------------------------

  def index
    @requests = @board.board_users.where('approval = ? AND user_id != ?', nil, @board.manager_user_id)
  end

  def reject_index
    @requests = @board.board_users.where(approval: false)
  end

  def admit_index
    @requests = @board.board_users.where(approval: true)
  end

  def show
    @request = BoardUser.find_by(id: params[:id])
  end

  # 申請拒否
  def reject
    if request = BoardUser.find_by(id: params[:id])
      request.update(approval: false)
      redirect_to board_board_users_path
    else
      redirect_to boards_path(@baord.id)
    end
  end

  # 申請の許可
  def admit
    if request = BoardUser.find_by(id: params[:id])
      request.update(approval: true)
      redirect_to board_board_users_path
    else
      redirect_to boards_path(@baord.id)
    end
  end




# 参加者側----------------------------------------------
  def new
    # 申請済みだった場合にリダイレクト
    if request = @user.board_users.find_by(board_id: @board.id)
      redirect_to edit_board_board_users_path(@board.id, request.id) and return
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
    set_request
    if @request&.approval == nil
    else
      redirect_to board_path(@board.id)
    end
  end

  # 変更
  def update
    set_request
    if @request.update(board_user_params)
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end

  # 申請の削除
  def destroy
    set_request
    @request.delete
    redirect_to board_path(@board.id)
  end




# private------------------------------------------------------
  private

    # リクエストを代入
    def set_request
      @request = @user.board_users.find_by(board_id: @board.id)
    end

    def set_board
      if @board = Board.find_by(id: params[:board_id])
      else
        redirect_to boards_path
        return
      end
    end

    # 募集の管理者のみに制限
    def only_manager
      board = Board.find_by(id: params[:board_id])
      user = User.find_by(id: current_user.id)
      unless board.manager_user == user
        redirect_to board_path(board.id)
      end
    end

  	def board_user_params
  		params.require(:board_user).permit(:comment).merge(board_id: @board.id)
  	end

end
