class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.decimal :amount
      t.resources :user
      t.resources :vacation

      t.timestamps
    end
  end
end
