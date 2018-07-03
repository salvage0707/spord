class Community < ApplicationRecord

	# refileの設定
	attachment :image

	belongs_to :area
	belongs_to :sport
	belongs_to :manager_user, class_name: "User"
	has_many :msg_to_community
	# 中間テーブル
	has_many :community_purposes, dependent: :destroy
	has_many :community_users, dependent: :destroy
	has_many :community_ranks, dependent: :destroy
	# 多対多
	has_many :users, through: :community_users
	has_many :purposes, through: :community_purposes
	has_many :ranks, through: :community_ranks

	validates :active_date, :introduction, :qualification, presence: true
	validates :name, presence: true, length: { in: 2.. 100 }
	validates :city, presence: true, length: { in: 2..10 }
	validates :max_people, presence: true, length: { in: 1..300 }
	validates :place, presence: true, length: { in: 2..100 }

	def good_users
		self.community_users.where(approval: true)
	end

	def rank_count(rank_name) 
		count = 0
		self.community_users.where(approval: true).each do |joining|
			if sport = joining.user.my_sports.find_by(sport_id: self.sport.id)
				if sport.rank.name == rank_name 
					count += 1
				end
			elsif rank_name == "初心者"
				count += 1
			end
		end
		return count
	end

end
