class FixColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :flights, :destination_airport_id, :departing_airport_id
    rename_column :flights, :time, :date
  end
end
