class AddFlightNoToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :flight_no, :string
  end
end
