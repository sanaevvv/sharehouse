class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false, null: false, comment: 'true: 管理者, false: 一般ユーザー'
  end
end
