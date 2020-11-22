class AddMaxpriceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :maxprice, :integer
  end
end
