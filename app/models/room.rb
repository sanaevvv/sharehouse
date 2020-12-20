class Room < ApplicationRecord
       has_many :reviews, dependent: :destroy
       has_many :users, through: :reviews
       has_one_attached :image
       acts_as_taggable
  # acts_as_taggable_on :tags　と同じ意味のエイリアス
  # tags のなかにIDやら名前などが入る。イメージ的には親情報。

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

       # roomのお気に入り判定 → vies側で呼び出し
       # current_userに特定の投稿がブックマークされているかされていないかの判定をするメソッド
       # 引数の(user)にはcurrent_userが引き渡されています。
       def bookmark_by(user)
              bookmarks.where(user_id: user.id).exists?
       end

       has_many :bookmarks, dependent: :destroy
       has_many :users, through: :bookmarks

end
