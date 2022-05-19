require "test_helper"

class Administrator::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrator_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get administrator_orders_show_url
    assert_response :success
  end
end
