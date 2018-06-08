class Board < ApplicationRecord
	belongs_to :community, required: false
	belongs_to :area
	belongs_to :sport
	belongs_to :manager_user, class_name: "User"
	# 中間テーブル
	has_many :board_purposes
	has_many :msg_to_boards
	has_many :board_users
	# 多対多
	has_many :users, through: :board_users
	has_many :purposes, through: :board_purposes


end
