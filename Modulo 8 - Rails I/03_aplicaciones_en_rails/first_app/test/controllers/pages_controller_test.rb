require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get one" do
    get pages_one_url
    assert_response :success
  end

  test "should get two" do
    get pages_two_url
    assert_response :success
  end
end
