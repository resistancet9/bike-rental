class HomeController < ApplicationController
  before_action :require_login
  
  def index
  	@bikes = Bike.all
  end
end
