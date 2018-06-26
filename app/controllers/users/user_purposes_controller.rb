class Users::UserPurposesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
  def index
  	@purpose = UserPurpose.new
  end

  def create
  	if @user.user_purposes.find_by(purpose_id: params[:user_purpose][:purpose_id])
  		redirect_to user_purposes_path and return
  	end
  	@purpose = @user.user_purposes.build(purpose_params)
  	if @purpose.save
  		redirect_to user_purposes_path
  	else
  		render :index
  	end
  end

  def update
  	@purpose = UserPurpose.find_by(id: params[:id])
  	if @purpose.save
  		redirect_to user_purposes_path
  	else
  		render :index
  	end
  end

  def destroy
  	@purpose = UserPurpose.find_by(id: params[:id])
  	@purpose.destroy
  	redirect_to user_purposes_path
  end

  private

  	def purpose_params
  		params.require(:user_purpose).permit(:purpose_id)
  	end


end
