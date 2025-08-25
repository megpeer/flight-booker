class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)
    return unless @booking.save

    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to @booking, notice: 'booking has been updated'
  end

  private

  # def booking_params
  #   params.expect(booking: [:flight_id, passengers_attributes: [[:name, :email]]])
  # end
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email, :_destroy]) # rubocop:disable Style/SymbolArray
  end
end
