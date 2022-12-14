class Flight < ApplicationRecord
  has_many :tickets
  has_many :bookings, through: :tickets

  belongs_to :origin_airport, class_name: "Airport", foreign_key: :origin_id
  belongs_to :destination_airport,
             class_name: "Airport",
             foreign_key: :destination_id
  belongs_to :airline, foreign_key: :airline_id
end
