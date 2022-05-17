require "test_helper"

class Administrator::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrator_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get administrator_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get administrator_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get administrator_customers_update_url
    assert_response :success
  end
end
