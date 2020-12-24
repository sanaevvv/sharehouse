class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :rooms, through: :reviews

  has_many :favorites, dependent: :destroy

  has_many :bookmarks, dependent: :destroy

  has_many :followers, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followerds, class_name: "Relationship", foreign_key: :followerd_id, dependent: :destroy
  has_many :following_users, through: :followers, source: :followerd #自分がフォローしている人
  has_many :follower_users, through: :followerds, source: :follower #自分がフォローされている人

  # ActiveStorage
  has_one_attached :image
  has_one_attached :profile_image

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  # ユーザーをフォローする
  def follow(user_id)
    followers.create(followerd_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    followers.find_by(followerd_id: user_id).destroy
  end

  # フォロー確認をおこなう
  def following?(user)
    following_users.include?(user)
  end


  # ユーザーがいいねしているか？
  # self = current_user
  def favorites?(review)
    self.favorites.exists?(review_id: review.id)
  end

  def user_rooms?(room)
    self.id == room.user_id
  end

end
