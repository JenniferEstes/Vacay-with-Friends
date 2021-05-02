class AddGroupIdToVacations < ActiveRecord::Migration[6.1]
  def change
    add_column :vacations, :group_id, :integer
  end
end
