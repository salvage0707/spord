class Users::CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  before_action :only_manager, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def show
  end

  def index
    @communities = Community.last(4)
  end

  def edit
  end

  def update
    # 特定のスポーツを代入
    sports_name = params[:sports_name]
    sport = Sport.find_name(sports_name)
    @community.sport_id = sport.id
    if @community.update(community_params)
      redirect_to community_path(@community.id)
    else
      render :edit
    end
  end


  def new
    @community = Community.new
  end

  def create
    # 特定のスポーツを代入
    sports_name = params[:sports_name]
    sport = Sport.find_name(sports_name)
    # 募集を作成
    @community = Community.new(community_params)
    @community.sport_id = sport.id
    if @community.save
      @community.community_users.create(user_id: current_user.id,
                                        approval: true)
      redirect_to community_path(@community.id)
    else
      render :new
    end
  end

  def destroy
  end

  def genre
    if genre = Sport.find_by(name: params[:genre])
      @communities = Community.where(sport_id: genre.id)
      render :index
    else
      redirect_to communities_path
    end
  end

  private
    def community_params
      params.require(:community).permit(:name,
                                        :image,
                                        :qualification,
                                        :area_id,
                                        :city,
                                        :place,
                                        :active_date,
                                        :max_people,
                                        :introduction,
                                        :manager_user_id,
                                        :purpose_ids => [],
                                        :rank_ids => [],
                                        )
    end

    # 募集の管理者のみに制限
    def only_manager
      community = Community.find_by(id: params[:id])
      user = User.find_by(id: current_user.id)
      unless community.manager_user == user
        redirect_to community_path(community.id)
      end
    end
end
