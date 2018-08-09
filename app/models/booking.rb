class Booking < ApplicationRecord
  # booking belongs to bike and user.
  belongs_to :bike
  belongs_to :user
end
