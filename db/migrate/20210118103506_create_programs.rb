class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :end
      t.datetime :start
      t.integer :init_smoke

      t.timestamps
    end
  end
end
