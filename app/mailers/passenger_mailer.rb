class PassengerMailer < ApplicationMailer
  default from: 'confirm@flights.com'
  def confirmation_email
    @booking = params[:booking]
    @flight = @booking.flight
    @passenger = params[:passenger]
    # @url = params[:url]
    mail(to: @passenger.email, subject: 'thanks for booking!')
  end
end
