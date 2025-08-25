class PassengerMailer < ApplicationMailer
  default from: 'confirm@flights.com'
  def confirmation_email
    @passenger = params[:name]
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'thanks for booking!')
  end
end
