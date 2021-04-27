class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :group_name
      t.integer :group_members
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
