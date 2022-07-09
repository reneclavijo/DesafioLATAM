require "test_helper"

class VinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vino = vinos(:one)
  end

  test "should get index" do
    get vinos_url
    assert_response :success
  end

  test "should get new" do
    get new_vino_url
    assert_response :success
  end

  test "should create vino" do
    assert_difference('Vino.count') do
      post vinos_url, params: { vino: { nombre: @vino.nombre } }
    end

    assert_redirected_to vino_url(Vino.last)
  end

  test "should show vino" do
    get vino_url(@vino)
    assert_response :success
  end

  test "should get edit" do
    get edit_vino_url(@vino)
    assert_response :success
  end

  test "should update vino" do
    patch vino_url(@vino), params: { vino: { nombre: @vino.nombre } }
    assert_redirected_to vino_url(@vino)
  end

  test "should destroy vino" do
    assert_difference('Vino.count', -1) do
      delete vino_url(@vino)
    end

    assert_redirected_to vinos_url
  end
end
