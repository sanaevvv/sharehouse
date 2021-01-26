class AddManagementScoreToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :Management_score, :integer
  end
end
