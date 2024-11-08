require "test_helper"

class ButtonTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get button_test_index_url
    assert_response :success
  end
end
