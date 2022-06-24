require "test_helper"

class CartaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartum = carta(:one)
  end

  test "should get index" do
    get carta_url
    assert_response :success
  end

  test "should get new" do
    get new_cartum_url
    assert_response :success
  end

  test "should create cartum" do
    assert_difference('Cartum.count') do
      post carta_url, params: { cartum: { descripcion: @cartum.descripcion, nombre: @cartum.nombre } }
    end

    assert_redirected_to cartum_url(Cartum.last)
  end

  test "should show cartum" do
    get cartum_url(@cartum)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartum_url(@cartum)
    assert_response :success
  end

  test "should update cartum" do
    patch cartum_url(@cartum), params: { cartum: { descripcion: @cartum.descripcion, nombre: @cartum.nombre } }
    assert_redirected_to cartum_url(@cartum)
  end

  test "should destroy cartum" do
    assert_difference('Cartum.count', -1) do
      delete cartum_url(@cartum)
    end

    assert_redirected_to carta_url
  end
end
