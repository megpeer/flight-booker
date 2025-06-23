# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Flight.destroy_all
Airport.destroy_all
Airport.create!([{ code: 'YYZ', city: 'Toronto' },
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
                 { code: 'YQM', city: 'Moncton' },
                 { code: 'YEG', city: 'Edmonton' }])
p "Created #{Airport.count} Airports"

# %w[YYZ YVR YYC YEG YUL YYT YWG YFC YHC YOW YQB YQX YQM YEG].each do |departure|
#   %w[YYZ YVR YYC YEG YUL YYT YWG YFC YHC YOW YQB YQX YQM YEG].each_with_index do |arrival, i|
#     next if departure.eql?(arrival)

#     f = Flight.new(time: Time.now + 1.months, duration: Time.now + 1.months + rand(1..10).hours)
#     f.departure_airport = Airport.find_by(code: departure)
#     f.arrival_airport = Airport.find_by(code: arrival)
#     f.save!
#   end
# end
Flight.create!([{ date: rand(1.year).seconds.from_now,
                  duration: '',
                  arrival_airport_id: 1,
                  departure_airport_id: 3 }])
p "Created #{Flight.count} Flights"
