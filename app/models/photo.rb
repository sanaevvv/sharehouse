class Photo < ApplicationRecord
  belongs_to :room

  has_one_attached :photo_image
end
