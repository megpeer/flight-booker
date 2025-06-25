class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @date = Flight.select(:date).distinct.order(:date)
  end

  def new
    @flight = Flight.new
    @arrival_options = Airport.all.map { |a| [a.city, a.id] }
  end

  def show
    @arrival_airport = Airport.all.map { |a| [a.city, a.id] }
  end

  def search
    @flights = if params[:search].blank?
                 Flight.all
               else
                 Flight.search(params)
               end
  end
end
