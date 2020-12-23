class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, comment: 'フォローした人のuser id'
      t.references :followerd, null: false, comment: 'フォローされた人のuser id'
      t.timestamps
    end
    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :followerd_id
    add_index :relationships, [:follower_id, :followerd_id], unique: true
  end
end
