class Users::BoardsController < ApplicationController
  before_action :set_info, only: [:new, :edit, :create, :update]
  def show
  	if @board = Board.find_by(id: params[:id])
  	else
  		redirect_to boards_path
  	end
  end

  def index
  	@new_boards = Board.last(4)
  end

  def edit
    if @board = Board.find_by(id: params[:id])
    else
      redirect_to boards_path
    end
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
      redirect_to board_path(@board.id)
    else
      render :new
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
