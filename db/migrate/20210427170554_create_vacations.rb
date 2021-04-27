class CreateVacations < ActiveRecord::Migration[6.1]
  def change
    create_table :vacations do |t|
      t.string :description
      t.date :date_traveling
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
