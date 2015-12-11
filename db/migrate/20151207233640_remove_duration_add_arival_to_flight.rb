class RemoveDurationAddArivalToFlight < ActiveRecord::Migration
  def up
    remove_column :flights, :duration
    rename_column :flights, :departure, :departure_datetime
    # add_column :flights, :flight_no, :string, after: :airline
    add_column(
      :flights,
      :arrival_datetime,
      :timestamp,
      after: :departure_datetime
    )
  end

  def down
    remove_column :flights, :arrival_datetime
    rename_column :flights, :departure_datetime, :departure
    add_column :flights, :duration, :timestamp, after: :departure
  end
end
