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
  	@new_boards = Board.last(4)
  end

  def new
    @board = Board.new
  end

  def create
    # 特定のスポーツを代入
    sports_name = params[:sports_name]
    sport = Sport.find_name(sports_name)
    # 募集を作成
    @board = Board.new(board_params)
    @board.sport_id = sport.id
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
    sports_name = params[:sports_name]
    sport = Sport.find_name(sports_name)
    @board.sport_id = sport.id
    if @board.update(board_params)
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end

  def destroy
  end



  private

    def board_params
      params.require(:board).permit(:name,
                                    :image,
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
