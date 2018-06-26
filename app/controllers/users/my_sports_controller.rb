class Users::MySportsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_user
  def index
  	@sport = MySport.new
  end

  def create
  	if @user.my_sports.find_by(sport_id: params[:my_sport][:sport_id])
  		redirect_to my_sports_path and return
  	end
  	@sport = @user.my_sports.build(sport_params)
  	if @sport.save
  		redirect_to my_sports_path
  	else
  		render :index
  	end
  end

  def update
  	@sport = MySport.find_by(id: params[:id])
  	if @sport.save
  		redirect_to my_sports_path
  	else
  		render :index
  	end
  end

  def destroy
  	@sport = MySport.find_by(id: params[:id])
  	@sport.destroy
  	redirect_to my_sports_path
  end

  private

  	def sport_params
  		params.require(:my_sport).permit(:sport_id, :how_long, :rank_id, )
  	end


end
