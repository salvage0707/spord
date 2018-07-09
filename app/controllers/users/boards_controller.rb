class Users::BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:show]
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :only_manager, only: [:edit, :update]


  def show
    # ユーザーがログインしている場合のみ
    if user_signed_in?
      @request = @user.board_users.find_by(board_id: @board.id)
    end
  end

  def index
		# 締め切り前のものを最新５件取得
  	@boards = Board.active.last(5)
  end

  def new
    @board = Board.new
  end

  def create
    # 募集を作成
    @board = Board.new(board_params)
    if @board.save
      @board.board_users.create(user_id: current_user.id,
                                approval: true,)
      redirect_to board_path(@board.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    # 特定のスポーツを代入
    if @board.update(board_params)
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end

  def destroy
  end

  def genre
    if sport = Sport.find_by(name: params[:genre])
      @boards = Board.active.where(sport_id: sport.id).page(params[:page]).per(10)
    else
      redirect_to boards_path
    end
  end

	def users
		@board = Board.find_by(id: params[:board_id])
	end

  private

    def board_params
      params.require(:board).permit(:name,
                                    :image,
																		:sport_id,
                                    :qualification,
                                    :area_id,
                                    :city,
                                    :place,
                                    :do_date,
                                    :max_people,
                                    :closing_date,
                                    :introduction,
                                    :manager_user_id,
                                    :purpose_ids => [],
                                    :rank_ids => [],
                                    )
    end

    # 募集の管理者のみに制限
    def only_manager
      board = Board.find_by(id: params[:id])
      user = User.find_by(id: current_user.id)
      unless board.manager_user == user
        redirect_to board_path(board.id)
      end
    end
end
