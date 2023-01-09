class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  before_action :set_passenger, only: %i[show]
  before_action :set_flight, only: %i[new]

  def new
    @booking = Booking.new
    session[:passenger_count].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    @passengers = @booking.passengers

    respond_to do |format|
      if @booking.save
        flash.notice =
          "Flight #{@booking.flight.flight_number} has been booked.  Check your inbox for a confirmation email."
        BookingMailer.new_booking(@booking).deliver_now
        format.html { redirect_to @booking }
      else
        format.html { redirect_to root_url, status: :unprocessable_entity }
      end
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

  def set_flight
    @flight = Flight.find(params[:booking][:flight])
  end

  def booking_params
    params.fetch(:booking, {}).permit(
      :flight_id,
      :passenger_count,
      passengers_attributes: %i[id passenger_name passenger_email]
    )
  end
end
