class AddAirportToFlights < ActiveRecord::Migration[8.0]
  def change
    change_table :flights do |t|
      t.belongs_to :arrival_airport
      t.belongs_to :destination_airport
    end
  end
end
