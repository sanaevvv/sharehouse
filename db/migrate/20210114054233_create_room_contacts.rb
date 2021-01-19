class CreateRoomContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :room_contacts do |t|
      t.string :title
      t.text :body
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
