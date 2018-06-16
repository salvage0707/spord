class Purpose < ApplicationRecord
	# 中間テーブル
	has_many :user_purposes
	has_many :board_purposes
	has_many :community_purposes
	# 多対多
	has_many :users, through: :user_purposes
	has_many :communities, through: :community_purposes
	has_many :boards, through: :board_purposes

	# 目的を設定していたらtrue
	def has_board?(board)
		self.boards.include?(board)
	end

	# ボタンの背景色を決定
	def what_color(board)
		if self.has_board?(board)
			"red"
		else
			"#ccc"
		end
	end

end
