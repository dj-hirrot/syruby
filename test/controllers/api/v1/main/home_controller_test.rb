require 'test_helper'

class Api::V1::Main::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get get_test_text" do
    get api_v1_main_home_get_test_text_url
    assert_response :success
  end

end
