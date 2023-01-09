# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
  def new_booking
    booking = Booking.last
    BookingMailer.new_booking(booking)
  end
end
