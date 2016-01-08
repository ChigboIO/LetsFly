class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :passenger, index: true, forein_key: true
      t.references :flight, index: true, forein_key: true

      t.timestamps null: false
    end
  end
end
