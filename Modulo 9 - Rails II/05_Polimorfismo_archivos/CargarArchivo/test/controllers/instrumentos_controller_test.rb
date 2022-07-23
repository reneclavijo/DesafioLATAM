require "test_helper"

class InstrumentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instrumento = instrumentos(:one)
  end

  test "should get index" do
    get instrumentos_url
    assert_response :success
  end

  test "should get new" do
    get new_instrumento_url
    assert_response :success
  end

  test "should create instrumento" do
    assert_difference('Instrumento.count') do
      post instrumentos_url, params: { instrumento: { nombre: @instrumento.nombre } }
    end

    assert_redirected_to instrumento_url(Instrumento.last)
  end

  test "should show instrumento" do
    get instrumento_url(@instrumento)
    assert_response :success
  end

  test "should get edit" do
    get edit_instrumento_url(@instrumento)
    assert_response :success
  end

  test "should update instrumento" do
    patch instrumento_url(@instrumento), params: { instrumento: { nombre: @instrumento.nombre } }
    assert_redirected_to instrumento_url(@instrumento)
  end

  test "should destroy instrumento" do
    assert_difference('Instrumento.count', -1) do
      delete instrumento_url(@instrumento)
    end

    assert_redirected_to instrumentos_url
  end
end
