class AddRoomIdToManagementCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :management_companies, :room, foreign_key: true
  end
end
