class BookingMailer < ApplicationMailer
  def new_booking(booking)
    @greeting = "Greetings,"
    @booking = booking

    mail to: @booking.passengers.pluck(:passenger_email),
         subject:
           "New booking for #{@booking.passengers.pluck(:passenger_name)}"
  end
end
