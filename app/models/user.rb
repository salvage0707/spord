class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  belongs_to :area
  has_many :msg_to_user
  has_many :msg_to_board
  has_many :msg_to_communities
  # フォロー関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :relationships, source: :followed
  # 中間テーブル
  has_many :my_sports
  has_many :board_users
  has_many :community_users
  has_many :user_purpose
  # 多対多
  has_many :sports, through: :my_sports
  has_many :boards, through: :board_users
  has_many :purposes, through: :user_purpose


  def full_name
    self.name.gsub(/#/, "")
  end

  # 年代を返す
  def generation
    if age[1]
      age / 10 * 10
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

  # 男性か判別
  def man?
    if sex == true
      true
    else
      false
    end
  end

  # 女性か判別
  def woman?
    if sex == true
      false
    else
      true
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

end
