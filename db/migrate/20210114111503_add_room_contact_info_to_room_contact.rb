class AddRoomContactInfoToRoomContact < ActiveRecord::Migration[6.0]
  def change
    add_column :room_contacts, :name, :string
    add_column :room_contacts, :email, :string
  end
end
