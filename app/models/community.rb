class Community < ApplicationRecord
	belongs_to :sport
	has_many :msg_to_community
	# 中間テーブル
	has_many :community_purposes
	has_many :community_users
	# 多対多
	has_many :users, through: :community_users
	has_many :purposes, through: :community_purposes

end
