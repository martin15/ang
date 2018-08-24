require 'test_helper'

class ServiceCenterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_center_index_url
    assert_response :success
  end

end
