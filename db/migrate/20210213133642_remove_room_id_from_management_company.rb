class RemoveRoomIdFromManagementCompany < ActiveRecord::Migration[6.0]
  def change
     remove_reference(:management_companies, :room, index: true, foreign_key: true)
  end

end
