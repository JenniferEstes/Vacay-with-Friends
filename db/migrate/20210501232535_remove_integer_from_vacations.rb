class RemoveIntegerFromVacations < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacations, :integer, :string
  end
end
