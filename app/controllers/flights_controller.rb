class FlightsController < ApplicationController
  def index
    @date = Flight.select(:date).distinct.order(:date)
    @airport = Airport.all
    @passengers = params[:passengers]
    if params[:departing_airport].present? && params[:arrival_airport].present? && params[:date].present?
      departure = Airport.where(city: params[:departing_airport])
      arrival = Airport.where(city: params[:arrival_airport])
      date = Date.parse(params[:date])
      @flights = Flight.where(departing_airport_id: departure, arrival_airport_id: arrival, date: date)
    else
      @flights = Flight.none
    end
  end
end
