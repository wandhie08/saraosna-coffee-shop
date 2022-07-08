require 'test_helper'

class PickupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pickup_index_url
    assert_response :success
  end

end
