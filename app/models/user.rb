class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  belongs_to :area, required: false
  has_many :messages, class_name:"MsgToUser", foreign_key: "to_user_id"
  has_many :msg_to_board
  has_many :msg_to_communities
	has_many :msg_to_users
  # フォロー関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :relationships, source: :followed
  # 中間テーブル
  has_many :my_sports
  has_many :board_users
  has_many :community_users
  has_many :user_purposes
  # 多対多
  has_many :sports, through: :my_sports
  has_many :boards, through: :board_users
  has_many :purposes, through: :user_purposes

  validates :nickname, :name, presence: true


  def full_name
    self.name.gsub(/#/, "")
  end

  # 年代を返す
  def generation
  	if self.age != nil
    	if self.age
      	gene = age / 10 * 10
        return "#{gene} 代"
  		end
  	else
		"設定されていません"
  	end
  end

  # 性別を返す
  def what_sex
    if sex == true
      "男性"
    else
      "女性"
    end
  end


  # 参加中の募集を返す
  def joining_boards
    boards = []
    board_users = self.board_users.where(approval: true)
    board_users.each do |b|
      boards <<  b.board
    end
    boards
  end

  # 参加中の募集を返す
  def joining_Communities
    communities = []
    community_users = self.community_users.where(approval: true)
    community_users.each do |b|
      communities <<  b.community
    end
    communities
  end

end
