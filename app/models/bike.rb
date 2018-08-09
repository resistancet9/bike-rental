class Bike < ApplicationRecord
  # single type of bike may belong to many bookings 
  has_and_belongs_to_many :bookings
end
