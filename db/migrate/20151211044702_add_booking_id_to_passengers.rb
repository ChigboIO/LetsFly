class AddBookingIdToPassengers < ActiveRecord::Migration
  def up
    remove_column :bookings, :passenger_id
    add_column :passengers, :booking_id, :integer, first: true
  end

  def down
    add_column :bookings, :passenger_id, :integer, after: :flight_id
    remove_column :passengers, :booking_id
  end
end
