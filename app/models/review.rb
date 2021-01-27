class Review < ApplicationRecord
  belongs_to :room
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :score, presence: true
  validates :Quiet_score, presence: true
  validates :Facility_score, presence: true
  validates :Relationships_score, presence: true
  validates :Management_score, presence: true

end
