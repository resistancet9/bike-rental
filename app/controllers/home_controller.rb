class HomeController < ApplicationController
  def index
    # get only those bikes which are available
    @bikes = Bike.all().where(:avail => 1)
    @booking = Booking.new
  end
end
