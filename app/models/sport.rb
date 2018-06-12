class Sport < ApplicationRecord
	has_many :communities
	has_many :boards
	# 中間テーブル
	has_many :my_sports
	# 多対多
	has_many :users, through: :my_sports




	# 検索してなかったら新規作成、あったら特定の物を返す
	def self.find_name(sports_name)
		if sports = find_by(name: sports_name)
			sports
		else
			sports = create(name: sports_name)
			sports
		end
	end
end
