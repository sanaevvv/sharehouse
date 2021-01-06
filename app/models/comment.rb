class Comment < ApplicationRecord
  belongs_to :review

  validates :name, length: { maximum: 15 }
  validates :body, presence: true, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }

end
