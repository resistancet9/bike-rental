require 'test_helper'

class BikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bike = bikes(:one)
  end

  test "should get index" do
    get bikes_url
    assert_response :success
  end

  test "should get new" do
    get new_bike_url
    assert_response :success
  end

  test "should create bike" do
    assert_difference('Bike.count') do
      post bikes_url, params: { bike: { avail: @bike.avail, bike_type: @bike.bike_type, cost_per_hour: @bike.cost_per_hour, day_rate: @bike.day_rate, description: @bike.description, image_url: @bike.image_url, location: @bike.location, qty: @bike.qty, weekend_rate: @bike.weekend_rate } }
    end

    assert_redirected_to bike_url(Bike.last)
  end

  test "should show bike" do
    get bike_url(@bike)
    assert_response :success
  end

  test "should get edit" do
    get edit_bike_url(@bike)
    assert_response :success
  end

  test "should update bike" do
    patch bike_url(@bike), params: { bike: { avail: @bike.avail, bike_type: @bike.bike_type, cost_per_hour: @bike.cost_per_hour, day_rate: @bike.day_rate, description: @bike.description, image_url: @bike.image_url, location: @bike.location, qty: @bike.qty, weekend_rate: @bike.weekend_rate } }
    assert_redirected_to bike_url(@bike)
  end

  test "should destroy bike" do
    assert_difference('Bike.count', -1) do
      delete bike_url(@bike)
    end

    assert_redirected_to bikes_url
  end
end
