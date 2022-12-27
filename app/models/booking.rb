class Booking < ApplicationRecord
  has_many :passengers, foreign_key: :booking_id, inverse_of: :booking
  belongs_to :flight,
             class_name: "Flight",
             foreign_key: :flight_id,
             inverse_of: :bookings
  accepts_nested_attributes_for :passengers, allow_destroy: true
  accepts_nested_attributes_for :flight, allow_destroy: true
end
