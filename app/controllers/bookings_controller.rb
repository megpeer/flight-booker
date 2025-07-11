class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    num_passengers = params[:passengers].to_i
    num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    return unless @booking.save

    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.expect(booking: [:flight_id, passengers_attributes: [[:name, :email]]]) # rubocop:disable Style/SymbolArray,Style/HashAsLastArrayItem
  end
end
