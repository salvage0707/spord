class ApplicationController < ActionController::Base
	# 新規登録時に、使用できるカラムを設定
	before_action :configure_permitted_parameters, if: :devise_controller?
	# 全ページに@userをセット
	before_action :set_user

	protected
		def configure_permitted_parameters
      # 新規登録に使用するカラム
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name])
	   end


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

		# コミュニティが存在していたら代入
		def set_community
			if @community = Community.find_by(id: params[:id])
			else
				redirect_to communities_path
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
