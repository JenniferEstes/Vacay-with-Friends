class RemoveGoalIdFromVacations < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacations, :goal_id, :integer
  end
end
