class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :rooms, through: :reviews
  has_many :favorites, dependent: :destroy

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


  def favorites?(review)
    self.favorites.exists?(review_id: review.id)
  end

end
