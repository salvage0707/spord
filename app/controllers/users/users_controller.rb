class Users::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_user, only: [:show, :edit, :update]
  def show
  	@this_user = User.find(params[:id])
  	@boards = @this_user.joining_boards
  	@communities = @this_user.joining_Communities
  end

  def edit
    only_me
  end

  def update
    only_me
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  # のちに実装
  # def destroy
  # end

  def index
  end

  private

    # 自分の編集のみに制限
    def only_me
      unless @user == User.find_by(id: params[:id])
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:nickname, :image, :name,:age, :area_id,:city, :sex, :purpose_id)
    end
end
