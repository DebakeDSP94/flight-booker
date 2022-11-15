class Flight < ApplicationRecord
  has_many :origins
  has_many :destinations
  has_many :bookings
  has_many :passengers, through: :bookings
end
