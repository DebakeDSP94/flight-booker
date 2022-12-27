class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_passenger, only: %i[show edit update destroy]
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
        format.html { redirect_to @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html do
          redirect to bookings_path,
                      success: "Booking has been successfully updated."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_path, status: :see_other }
    end
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
      :flight,
      :flight_id,
      :arrival_airport,
      :departure_airport,
      :passenger_count,
      :airline,
      passengers_attributes: %i[id passenger_name passenger_email]
    )
  end
end
