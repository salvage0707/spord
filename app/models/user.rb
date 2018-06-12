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
  has_many :purpose, through: :user_purpose

end
