class AddQuietScoreToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :Quiet_score, :integer
  end
end
