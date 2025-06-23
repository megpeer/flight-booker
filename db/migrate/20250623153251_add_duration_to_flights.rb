class AddDurationToFlights < ActiveRecord::Migration[8.0]
  def change
    add_column :flights, :duration, :integer
  end
end
