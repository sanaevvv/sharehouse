class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :rooms, through: :reviews
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_one :follower, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_one :followed, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォロー確認をおこなう
  def following?(user)
    following_user.include?(user)
  end


  def favorites?(review)
    self.favorites.exists?(review_id: review.id)
  end

end
