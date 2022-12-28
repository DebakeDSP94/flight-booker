class Passenger < ApplicationRecord
  belongs_to :booking, foreign_key: :booking_id, inverse_of: :passengers

  validates_presence_of :passenger_name, :passenger_email
end
