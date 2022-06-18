require "test_helper"

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get registro" do
    get usuarios_registro_url
    assert_response :success
  end
end
