class Review < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # validates :score, presence: true
  # スコア必須
end
