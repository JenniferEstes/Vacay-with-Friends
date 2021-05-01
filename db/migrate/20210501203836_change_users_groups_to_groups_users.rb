class ChangeUsersGroupsToGroupsUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :users_groups, :groups_users
  end
end
