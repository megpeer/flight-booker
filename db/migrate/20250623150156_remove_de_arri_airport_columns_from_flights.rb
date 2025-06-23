class RemoveDeArriAirportColumnsFromFlights < ActiveRecord::Migration[8.0]
  def change
    remove_column :flights, :departure_airport
    remove_column :flights, :arrival_airport
    remove_column :flights, :duration
  end
end
