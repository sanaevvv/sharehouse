class Review < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :score, presence: true

  has_many :favorites, dependent: :destroy

end
