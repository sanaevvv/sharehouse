class Favorite < ApplicationRecord
     belongs to :user
     belongs to :review

     validates_uniqueness_of :review_id, scope: :user_id
end
