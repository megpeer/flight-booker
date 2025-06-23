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
yeg = Airport.create!(code: 'YEG', city: 'Edmonton')
p "Created #{Airport.count} Airports"
Flight.create!([
                 { departing_airport: yyz, arrival_airport: yvr, date: Date.today + 1.day, duration: 360 },
                 { departing_airport: yyc, arrival_airport: yul, date: Date.today + 2.days, duration: 240 },
                 { departing_airport: yqm, arrival_airport: yyz, date: Date.today + 3.days, duration: 180 },
                 { departing_airport: yeg, arrival_airport: yqm, date: Date.today + 4.days, duration: 300 },
                 { departing_airport: yyt, arrival_airport: yfc, date: Date.today + 5.days, duration: 210 }
               ])
p "Created #{Flight.count} Flights"
