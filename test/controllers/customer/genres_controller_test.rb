require "test_helper"

class Customer::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_genres_index_url
    assert_response :success
  end
end
