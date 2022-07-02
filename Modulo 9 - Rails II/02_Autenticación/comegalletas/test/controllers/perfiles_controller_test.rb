require "test_helper"

class PerfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get publico" do
    get perfiles_publico_url
    assert_response :success
  end

  test "should get privado" do
    get perfiles_privado_url
    assert_response :success
  end
end
