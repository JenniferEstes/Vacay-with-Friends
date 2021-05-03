class AddUserRefToGoals < ActiveRecord::Migration[6.1]
  def change
    add_reference :goals, :user, null: false, foreign_key: true
  end
end
