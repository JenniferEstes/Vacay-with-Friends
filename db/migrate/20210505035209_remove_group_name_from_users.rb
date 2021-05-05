class RemoveGroupNameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :group_name, :string
  end
end
