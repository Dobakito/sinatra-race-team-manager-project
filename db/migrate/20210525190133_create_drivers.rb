class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :number
      t.string :driver_class
      t.integer :team_id
    end
  end
end
