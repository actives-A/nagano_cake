require "test_helper"

class Administrator::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrator_items_index_url
    assert_response :success
  end

  test "should get show" do
    get administrator_items_show_url
    assert_response :success
  end

  test "should get new" do
    get administrator_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get administrator_items_edit_url
    assert_response :success
  end
end
