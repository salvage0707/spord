class ApplicationController < ActionController::Base

	def set_user
		@user = User.find_by(id: current_user.id)
	end
end
