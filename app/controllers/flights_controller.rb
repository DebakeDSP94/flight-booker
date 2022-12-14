class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]
  def index
    @airports = Airport.all
    @search_results = []
    @search_results = search_flights(flight_params)
    puts @search_results
  end

  def show
  end

  def search_flights(params)
    flights = Flight.all
    date =
      Date.new params["departure_date(1i)"].to_i,
               params["departure_date(2i)"].to_i,
               params["departure_date(3i)"].to_i
    flights = flights.where(departure_date: date)
    flights = flights.where(origin_id: params[:origin_id])
    flights = flights.where(destination_id: params[:destination_id])
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flights).permit(
      :date,
      :flight_number,
      :duration,
      :origin_id,
      :airline_id,
      :destination_id,
      :departure_time,
      :departure_date,
      :passengers,
      :origin,
      :destination,
      :airport
    )
  end
end
