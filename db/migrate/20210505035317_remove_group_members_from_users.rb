class RemoveGroupMembersFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :group_members, :integer
  end
end
