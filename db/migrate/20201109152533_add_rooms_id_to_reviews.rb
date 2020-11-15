class AddRoomsIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :room, foreign_key: true
  end
end


