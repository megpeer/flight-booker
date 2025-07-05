class FlightsController < ApplicationController
  def index
    @date = Flight.select(:date).distinct.order(:date)
    @airport = Airport.all
    # @arrival_airport = Airport.joins(:arriving_airport).distinct
    @passengers = params[:passengers]
    # @flights = Flight.where(
    #   departing_airport: params[:departing_airport],
    #   arrival_airport: params[:arrival_airport],
    #   date: params[:date]
    # )
    if params[:departing_airport].present? && params[:arrival_airport].present? && params[:date].present?
      dep = Airport.where(city: params[:departing_airport])
      arr = Airport.where(city: params[:arrival_airport])
      date = Date.parse(params[:date])

      @flights = Flight.where(departing_airport_id: dep, arrival_airport_id: arr, date: date)
    else
      @flights = Flight.none
    end
  end

  private

  def search_params
    params[:departing_airport].present? &&
      params[:arrival_airport].present? &&
      params[:date].present?
  end
end
