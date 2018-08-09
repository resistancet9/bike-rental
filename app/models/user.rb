class User < ApplicationRecord
  include Clearance::User
  # single user can have many bookings. 
  has_many :bookings
end
