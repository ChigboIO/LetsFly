class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.integer :airport_id
      t.integer :airport_id
      t.timestamp :departure
      t.integer :duration
      t.decimal :price
      t.integer :capacity
      t.integer :available_seats

      t.timestamps null: false
    end
  end
end
