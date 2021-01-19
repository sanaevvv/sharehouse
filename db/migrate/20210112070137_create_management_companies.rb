class CreateManagementCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :management_companies do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
