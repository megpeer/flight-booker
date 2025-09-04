class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        @booking.passengers.each do |passenger|
          PassengerMailer.with(booking: @booking, passenger: passenger).confirmation_email.deliver_now
        end
        format.html { redirect_to booking_path(@booking) }
      else
        puts @booking.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
      end
    end
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
