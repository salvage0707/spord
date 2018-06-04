class Board < ApplicationRecord
	belongs_to :community
	belongs_to :sport
	# 中間テーブル
	has_many :board_purposes
	has_many :msg_to_boards
	has_many :board_users
	# 多対多
	has_many :users, through: :board_users
	has_many :purposes, through: :board_purposes


end
