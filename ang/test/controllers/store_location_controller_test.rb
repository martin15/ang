require 'test_helper'

class StoreLocationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_location_index_url
    assert_response :success
  end

end
