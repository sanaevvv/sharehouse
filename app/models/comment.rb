class Comment < ApplicationRecord
  belongs_to :review

  validates :name, length: { maximun: 15 }
  validates :body, presence: true, length: { maximun: 140 }
end
