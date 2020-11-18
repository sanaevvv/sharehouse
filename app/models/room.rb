class Room < ApplicationRecord
       has_many :reviews, dependent: :destroy
       has_many :users, through: :reviews
       has_one_attached :picture
       def avg_score
              unless self.reviews.empty?
                     reviews.average(:score).to_f.round(2)
              else
                     0.0
              end
       end
       def review_score_percentage
              unless self.reviews.empty?
                     reviews.average(:score).to_f*100/5.round(2)
              else
                     0.0
              end
       end
end
