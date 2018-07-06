class Users::MsgToCommunitiesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user
  def index
		@message = MsgToCommunity.new
		@community = Community.find_by(id: params[:community_id])
  end

	def create
		@message = @user.msg_to_communities.new(message_params)
		if @message.save
			redirect_to community_message_path(params[:community_id])
		else
			@community = Community.find(params[:community_id])
			render :index
		end
	end

	private

		def message_params
			params.require(:msg_to_community).permit(:message).merge(community_id: params[:community_id])
		end
end
