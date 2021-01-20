class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.references :program, null: false, foreign_key: true
      t.date :day_date
      t.integer :cigarettes_allowed
      t.integer :smoked_cigarettes

      t.timestamps
    end
  end
end
