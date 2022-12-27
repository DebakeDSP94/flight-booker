class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]
  before_action :update_flights

  def new
    @flight = Flight.new
  end

  def index
    @airports = Airport.all
    @flights = Flight.all
    @search_results = search_flights(flight_params)
    @booking = Booking.new
  end

  def show
  end

  def search_flights(params)
    flights = Flight.all
    session[:passenger_count] = params[:passenger_count]

    unless params["departure_date(1i)"].nil?
      date =
        Date.new params["departure_date(1i)"].to_i,
                 params["departure_date(2i)"].to_i,
                 params["departure_date(3i)"].to_i
    end
    flights = flights.where(departure_date: date)
    flights = flights.where(origin_id: params[:origin_id])
    flights = flights.where(destination_id: params[:destination_id])
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def update_flights
    flights = Flight.all

    oldflights = flights.where("departure_date < ?", Date.today)
    oldflights.all.each do |oldflight|
      oldflight.departure_date += 30.days
      oldflight.departure_time += 30.days
      oldflight.save
    end
  end

  def flight_params
    params.fetch(:flights, {}).permit(
      :flights,
      :flight_number,
      :duration,
      :origin_id,
      :airline_id,
      :destination_id,
      :departure_time,
      :departure_date,
      :passenger_count
    )
  end
end
