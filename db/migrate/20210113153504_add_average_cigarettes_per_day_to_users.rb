class AddAverageCigarettesPerDayToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :average_cigarettes_per_day, :integer,null:true
    add_column :users, :hour_of_first_smoke, :time, null: true
  end
end
