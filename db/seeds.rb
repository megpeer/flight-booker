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

yyz = Airport.create!(code: 'YYZ', city: 'Toronto')
yvr = Airport.create!(code: 'YVR', city: 'Vancouver')
yyc = Airport.create!(code: 'YYC', city: 'Calgary')
yeg = Airport.create!(code: 'YEG', city: 'Edmonton')
yul = Airport.create!(code: 'YUL', city: 'Montreal')
yyt = Airport.create!(code: 'YYT', city: "St. John's")
ywg = Airport.create!(code: 'YWG', city: 'Winnipeg')
yfc = Airport.create!(code: 'YFC', city: 'Fredericton')
yhc = Airport.create!(code: 'YHC', city: 'Halifax')
yow = Airport.create!(code: 'YOW', city: 'Ottawa')
yqb = Airport.create!(code: 'YQB', city: 'Quebec City')
yqx = Airport.create!(code: 'YQX', city: 'Gander')
yqm = Airport.create!(code: 'YQM', city: 'Moncton')
p "Created #{Airport.count} Airports"
1000.times do
  departing_airport, arrival_airport = Airport.all.sample(2).map(&:id)
  date = Date.today + rand(10..20).days
  duration = rand(60..500).to_i

  Flight.find_or_create_by!(departing_airport_id: departing_airport,
                            arrival_airport_id: arrival_airport,
                            date: date,
                            duration: duration)
end
p "Created #{Flight.count} Flights"
