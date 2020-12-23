class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followerd, class_name: "User"
  validates :follower_id, presence: true
  validates :followerd_id, presence: true
  validates :follower_id, uniqueness: { scope: :followerd_id}
end
