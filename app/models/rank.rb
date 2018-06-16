class Rank < ApplicationRecord

	# 中間テーブル
	has_many :my_sports
	has_many :board_ranks
	has_many :community_ranks

	has_many :users, through: :my_sports
	has_many :boards, through: :board_ranks
	has_many :communities, through: :community_ranks

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
