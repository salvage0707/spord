class Board < ApplicationRecord

	# refileの設定
	attachment :image

	belongs_to :community, required: false
	belongs_to :area
	belongs_to :sport
	belongs_to :manager_user, class_name: "User"
	# 中間テーブル
	has_many :board_purposes
	has_many :msg_to_boards
	has_many :board_users
	has_many :board_ranks
	# 多対多
	has_many :users, through: :board_users
	has_many :purposes, through: :board_purposes
	has_many :ranks, through: :board_ranks

	validates :do_date, :closing_date, :introduction, :qualification, presence: true
	validates :name, presence: true, length: { in: 2.. 100 }
	validates :city, presence: true, length: { in: 2..10 }
	validates :max_people, presence: true, length: { in: 1..100 }
	validates :place, presence: true, length: { in: 2..100 }


	# 関連づいたpurposeの作成、削除
	def make_purpose(params)
		# 現在設定中のpurposeのidを配列にする
		setting_purposes = []
		self.purposes.each{|k| setting_purposes << k.id}
		# 設定中の場合は作成
		params.select{|k, _| k.match(/purpose_/)}.each do |_, val|
			unless setting_purposes.include?(val)
     		self.board_purposes.create(purpose_id: val)
     	end
     	# 現在設定中ならむし
     	setting_purposes.delete(val) if setting_purposes.include?(val)
    end
    setting_purposes.each do |set|
    	self.board_purposes.find_by(purpose_id: set).delete
    end
	end

	# 関連づいたrankの作成、削除
	def make_rank(params)
		# 現在設定中のrankのidを配列にする
		setting_ranks = []
		self.ranks.each{|k| setting_ranks << k.id}
		# 設定中の場合は作成
		params.select{|k, _| k.match(/rank_/)}.each do |_, val|
			unless setting_ranks.include?(val)
     		self.board_ranks.create(rank_id: val)
     	end
     	# 現在設定中ならむし
     	setting_ranks.delete(val) if setting_ranks.include?(val)
    end
    setting_ranks.each do |set|
    	self.board_ranks.find_by(rank_id: set).delete
    end
	end

end
