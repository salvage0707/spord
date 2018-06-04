class Sport < ApplicationRecord
	has_many :communities
	has_many :boards
	# 中間テーブル
	has_many :my_sports
	# 多対多
	has_many :users, through: :my_sports
end
