require 'test_helper'

class SubDriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_driver = sub_drivers(:one)
  end

  test "should get index" do
    get sub_drivers_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_driver_url
    assert_response :success
  end

  test "should create sub_driver" do
    assert_difference('SubDriver.count') do
      post sub_drivers_url, params: { sub_driver: {  } }
    end

    assert_redirected_to sub_driver_url(SubDriver.last)
  end

  test "should show sub_driver" do
    get sub_driver_url(@sub_driver)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_driver_url(@sub_driver)
    assert_response :success
  end

  test "should update sub_driver" do
    patch sub_driver_url(@sub_driver), params: { sub_driver: {  } }
    assert_redirected_to sub_driver_url(@sub_driver)
  end

  test "should destroy sub_driver" do
    assert_difference('SubDriver.count', -1) do
      delete sub_driver_url(@sub_driver)
    end

    assert_redirected_to sub_drivers_url
  end
end
