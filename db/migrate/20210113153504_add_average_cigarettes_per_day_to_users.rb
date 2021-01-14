class AddAverageCigarettesPerDayToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :average_cigarettes_per_day, :integer,null:true
  end
end
