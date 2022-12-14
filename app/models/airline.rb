class Airline < ApplicationRecord
  has_many :flights, foreign_key: :airline_id
end
