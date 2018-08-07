class BookingsController < ApplicationController
  puts "----------------------------------------------------------------------------------------------------------------------"
  before_action :require_login
  
  def index
    @bookings = Booking.all().where(:user_id => current_user.id)
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      format.html { render :new}
      puts "Failed"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:bike_id, :qty, :startdate, :enddate, :user_id, :days)
  end
end
