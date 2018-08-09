class BookingsController < ApplicationController
  # to access these routes, one must be logged in.
  before_action :require_login
  
  def index
    # get bookins of the user who is currently logged in.
    @bookings = Booking.all().where(:user_id => current_user.id)
  end

  def create
    # we get form data via POST method. we use Booking.new() to create a new record in the db
    # we don't watch unwanted data to be inserted in the db, we write a private function that lets
    # us permit which data we want to insert data.
    @booking = Booking.new(booking_params)
    if @booking.save

      # we update the quantity and available flag in the db.
      @qty_to_remove = @booking.qty
      @bike_id = @booking.bike_id

      @bike = Bike.find(@bike_id);
      @bike.qty = @bike.qty - @qty_to_remove;
      
      if(@bike.qty == 0)
        @bike.avail = 0
      end

      # update quantity in bike table and also avail flag.
      if @bike.save
        # after we save to db. we send user to /bookings path
        redirect_to bookings_path
      else
        redirect_to home_path
      end
    else
      # if something is wrong. we render home path.
      redirect_to home_path
    end

  end

  def show
    # get booking data by id in the URL.
    @booking = Booking.find(params[:id])

    # we subtract weekend days by number of days selected by user
    @weekdays = @booking.days - @booking.weekenddays
    @weekends = @booking.weekenddays

    # total hours times cost per hour.
    @total_hours_cost = @booking.hours * @booking.bike.cost_per_hour

    # get day and weekend rate of the bike chosen.
    @day_rate = @booking.bike.day_rate
    @weekend_rate = @booking.bike.weekend_rate

    # calculate weekday and weekend price
    @total_days_cost = (@weekdays * @day_rate) + (@weekends * @weekend_rate)


    puts "+++++ " + @total_days_cost.to_s + " " + @total_hours_cost.to_s
    
    # total number of hours bike is rented for times per hour cost.
    @total_cost = @total_days_cost + @total_hours_cost
  end

  private
  def booking_params
    # Allows you to choose which attributes should be whitelisted for mass updating and thus prevent accidentally exposing that which shouldn't be exposed.
    params.require(:booking).permit(:bike_id, :hours, :qty, :start_date, :end_date, :user_id, :days, :weekdays, :weekenddays)
  end
end
