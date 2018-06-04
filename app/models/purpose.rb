class Purpose < ApplicationRecord
	# 中間テーブル
	has_many :user_purposes
	has_many :board_purposes
	has_many :community_purposes
	# 多対多
	has_many :users, through: :user_purposes
	has_many :communities, through: :community_purposes
	has_many :boards, through: :board_purposes
end
