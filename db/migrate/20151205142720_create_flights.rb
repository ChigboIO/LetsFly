class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.integer :origin_airport_id
      t.integer :destination_airport_id
      t.timestamp :departure
      t.integer :duration
      t.decimal :price
      t.integer :capacity
      t.integer :available_seats

      t.timestamps null: false
    end
  end
end
