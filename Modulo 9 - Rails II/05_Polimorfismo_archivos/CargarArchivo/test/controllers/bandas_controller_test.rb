require "test_helper"

class BandasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banda = bandas(:one)
  end

  test "should get index" do
    get bandas_url
    assert_response :success
  end

  test "should get new" do
    get new_banda_url
    assert_response :success
  end

  test "should create banda" do
    assert_difference('Banda.count') do
      post bandas_url, params: { banda: { nombre: @banda.nombre } }
    end

    assert_redirected_to banda_url(Banda.last)
  end

  test "should show banda" do
    get banda_url(@banda)
    assert_response :success
  end

  test "should get edit" do
    get edit_banda_url(@banda)
    assert_response :success
  end

  test "should update banda" do
    patch banda_url(@banda), params: { banda: { nombre: @banda.nombre } }
    assert_redirected_to banda_url(@banda)
  end

  test "should destroy banda" do
    assert_difference('Banda.count', -1) do
      delete banda_url(@banda)
    end

    assert_redirected_to bandas_url
  end
end
