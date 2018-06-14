class ApplicationController < ActionController::Base

	def set_user
		@user = User.find_by(id: current_user.id) if current_user
	end

	# 募集が存在していたら代入
	def set_board
		if @board = Board.find_by(id: params[:id])
		else
			redirect_to boards_path
      return
		end
	end

	# 使用をログインユーザーのみに制限
	def only_signed_in
		unless current_user
			redirect_to new_user_session_path
		end
	end

end
