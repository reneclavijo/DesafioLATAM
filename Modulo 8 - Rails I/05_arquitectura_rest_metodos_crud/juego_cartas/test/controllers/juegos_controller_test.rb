require "test_helper"

class JuegosControllerTest < ActionDispatch::IntegrationTest
  test "should get listar" do
    get juegos_listar_url
    assert_response :success
  end

  test "should get mostrar" do
    get juegos_mostrar_url
    assert_response :success
  end

  test "should get nuevo" do
    get juegos_nuevo_url
    assert_response :success
  end

  test "should get editar" do
    get juegos_editar_url
    assert_response :success
  end
end
