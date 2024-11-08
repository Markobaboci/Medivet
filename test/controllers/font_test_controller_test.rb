require "test_helper"

class FontTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get font_test_index_url
    assert_response :success
  end
end
