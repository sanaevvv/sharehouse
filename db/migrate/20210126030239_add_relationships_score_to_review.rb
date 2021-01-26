class AddRelationshipsScoreToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :Relationships_score, :integer
  end
end
