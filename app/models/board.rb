class Board < ApplicationRecord
	scope :active, -> { where("closing_date >= ?", Date.today) }

	# refileの設定
	attachment :image

	belongs_to :community, required: false
	belongs_to :area
	belongs_to :sport
	belongs_to :manager_user, class_name: "User"
	# 中間テーブル
	has_many :board_purposes, dependent: :destroy
	has_many :msg_to_boards, dependent: :destroy
	has_many :board_users, dependent: :destroy
	has_many :board_ranks, dependent: :destroy
	# 多対多
	has_many :users, through: :board_users
	has_many :purposes, through: :board_purposes
	has_many :ranks, through: :board_ranks

	validates :do_date, :closing_date, :introduction, :qualification, presence: true
	validates :name, presence: true, length: { in: 2.. 100 }
	validates :city, presence: true, length: { in: 2..10 }
	validates :max_people, presence: true, length: { in: 1..100 }
	validates :place, presence: true, length: { in: 2..100 }

	def good_users
		self.board_users.where(approval: true)
	end

end
