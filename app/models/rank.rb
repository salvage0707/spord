class Rank < ApplicationRecord

	# 中間テーブル
	has_many :my_sports
	has_many :board_ranks
	has_many :community_ranks
	# 多対多
	has_many :users, through: :my_sports
	has_many :boards, through: :board_ranks
	has_many :communities, through: :community_ranks

	# 目的を設定していたらtrue
	def has_model?(model)
		if self.boards.include?(model)
			true
		elsif self.communities.include?(model)
			true
		else
			false
		end
	end

	# ボタンの背景色を決定
	def what_color(model)
		if self.has_model?(model)
			"#e0ffff"
		else
			"#ccc"
		end
	end
end
