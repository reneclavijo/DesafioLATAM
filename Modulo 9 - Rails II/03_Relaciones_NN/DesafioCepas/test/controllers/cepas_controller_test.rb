require "test_helper"

class CepasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cepa = cepas(:one)
  end

  test "should get index" do
    get cepas_url
    assert_response :success
  end

  test "should get new" do
    get new_cepa_url
    assert_response :success
  end

  test "should create cepa" do
    assert_difference('Cepa.count') do
      post cepas_url, params: { cepa: { nombre: @cepa.nombre } }
    end

    assert_redirected_to cepa_url(Cepa.last)
  end

  test "should show cepa" do
    get cepa_url(@cepa)
    assert_response :success
  end

  test "should get edit" do
    get edit_cepa_url(@cepa)
    assert_response :success
  end

  test "should update cepa" do
    patch cepa_url(@cepa), params: { cepa: { nombre: @cepa.nombre } }
    assert_redirected_to cepa_url(@cepa)
  end

  test "should destroy cepa" do
    assert_difference('Cepa.count', -1) do
      delete cepa_url(@cepa)
    end

    assert_redirected_to cepas_url
  end
end
