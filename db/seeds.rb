# DESTROY OLD ENTRIES
Passenger.delete_all
Booking.delete_all
Flight.delete_all
Airport.delete_all

# CREATE ALL AIRPORTS
airports = [
  { code: 'YYZ', city: 'Toronto' },
  { code: 'YVR', city: 'Vancouver' },
  { code: 'YYC', city: 'Calgary' },
  { code: 'YEG', city: 'Edmonton' },
  { code: 'YUL', city: 'Montreal' },
  { code: 'YYT', city: "St. John's" },
  { code: 'YWG', city: 'Winnipeg' },
  { code: 'YFC', city: 'Fredericton' },
  { code: 'YHC', city: 'Halifax' },
  { code: 'YOW', city: 'Ottawa' },
  { code: 'YQB', city: 'Quebec City' },
  { code: 'YQX', city: 'Gander' },
  { code: 'YQM', city: 'Moncton' }
]
airports.each do |data|
  Airport.create!(data)
end
p "Created #{Airport.count} Airports"

# CREATE FLIGHTS - OPTION FOR EVERY DAY, EVERY AIRPORT
airports = Airport.all
start_date = Date.today
end_date = start_date + 30.days

(start_date..end_date).each do |date|
  airports.each do |departure_airport|
    airports.each do |arrival_airport|
      next if departure_airport == arrival_airport

      duration = rand(60..500).to_i
      Flight.create!(
        departing_airport: departure_airport,
        arrival_airport: arrival_airport,
        date: date,
        duration: duration
      )
    end
  end
end
p "Created #{Flight.count} flights"
