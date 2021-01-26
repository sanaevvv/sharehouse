class AddFacilityScoreToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :Facility_score, :integer
  end
end
