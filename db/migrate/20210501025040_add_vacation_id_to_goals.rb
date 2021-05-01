class AddVacationIdToGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :vacation_id, :integer
  end
end
