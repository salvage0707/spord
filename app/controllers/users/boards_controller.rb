class Users::BoardsController < ApplicationController
  before_action :set_info, only: [:new, :edit, :create, :update]
  before_action :set_user, only: [:show]
  before_action :set_board, only: [:show, :edit, :update]


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
      # 目的を作成
      @board.make_purpose(params)
      # ランクを作成
      @board.make_ranks(params)
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
      # 目的を作成
      @board.make_purpose(params)
      # ランクを作成
      @board.make_rank(params)
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end



  private

    def board_params
      params.require(:board).permit(:name,
                                    :qualification,
                                    :area_id,
                                    :city,
                                    :place,
                                    :do_date,
                                    :max_people,
                                    :closing_date,
                                    :introduction,
                                    :manager_user_id
                                    )
    end

    def set_info
      @ranks = Rank.all
      @areas = Area.all
      @purposes = Purpose.all
    end
end
