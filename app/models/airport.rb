class Airport < ApplicationRecord
  has_many :departures, class_name: "Flight", foreign_key: :origin_id
  has_many :arrivals, class_name: "Flight", foreign_key: :destination_id
end
