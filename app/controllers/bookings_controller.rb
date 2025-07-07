class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    num_passengers = params[:passengers].to_i
    num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'booking has been saved!'
      puts 'saved booking'
    else
      flash.now[:alert] = 'could not save booking'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passenger_info: %i[name email])
  end
end
