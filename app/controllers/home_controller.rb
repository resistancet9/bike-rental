class HomeController < ApplicationController
  def index
    @bikes = Bike.all
    @booking = Booking.new
  end
end
