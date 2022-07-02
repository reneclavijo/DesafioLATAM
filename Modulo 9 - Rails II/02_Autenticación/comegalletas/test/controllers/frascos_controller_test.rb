require "test_helper"

class FrascosControllerTest < ActionDispatch::IntegrationTest
  test "should get ver" do
    get frascos_ver_url
    assert_response :success
  end

  test "should get asignar" do
    get frascos_asignar_url
    assert_response :success
  end

  test "should get borrar" do
    get frascos_borrar_url
    assert_response :success
  end
end
