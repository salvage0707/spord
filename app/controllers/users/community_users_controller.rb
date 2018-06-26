class Users::CommunityUsersController < ApplicationController
 	before_action :set_community
  before_action :set_user
  # 使用を制限
  before_action :authenticate_user!
  before_action :only_manager, only: [:show, :index, :reject]



# 作成者側------------------------------------------------------

  def index
    @requests = @community.community_users.where(approval: nil)
  end

  def reject_index
    @requests = @community.community_users.where(approval: false)
  end

  def admit_index
    @requests = @community.community_users.where(approval: true)
  end

  def show
    @request = CommunityUser.find_by(id: params[:id])
  end

  # 申請拒否
  def reject
    if request = CommunityUser.find_by(id: params[:id])
      request.update(approval: false)
      redirect_to community_community_users_path
    else
      redirect_to communities_path(@baord.id)
    end
  end

  # 申請の許可
  def admit
    if request = CommunityUser.find_by(id: params[:id])
      request.update(approval: true)
      redirect_to community_community_users_path
    else
      redirect_to communities_path(@baord.id)
    end
  end




# 参加者側----------------------------------------------
  def new
    # 申請済みだった場合にリダイレクト
    if set_request
      redirect_to edit_community_community_user_path(@community.id, @request.id) and return
    end
  	@request = @user.community_users.build
  end

  def create
		@request = @user.community_users.build(community_user_params)
    # 保存の確認
		if @request.save
			redirect_to community_path(@community.id) and return
		else
			render :new
		end
  end

  def edit
    # 募集にリクエストが通っているか確認
    set_request
    if @request&.approval == nil
    else
      redirect_to community_path(@community.id)
    end
  end

  # 変更
  def update
    set_request
    if @request.update(community_user_params)
      redirect_to community_path(@community.id)
    else
      render :edit
    end
  end

  # 申請の削除
  def destroy
    set_request
    @request.delete
    redirect_to community_path(@community.id)
  end




# private------------------------------------------------------
  private

    # リクエストを代入
    def set_request
      @request = @user.community_users.find_by(community_id: @community.id)
    end

    def set_community
      if @community = Community.find_by(id: params[:community_id])
      else
        redirect_to communities_path
        return
      end
    end

    # 募集の管理者のみに制限
    def only_manager
      community = Community.find_by(id: params[:community_id])
      user = User.find_by(id: current_user.id)
      unless community.manager_user == user
        redirect_to community_path(community.id)
      end
    end

  	def community_user_params
  		params.require(:community_user).permit(:comment).merge(community_id: @community.id)
  	end


end
