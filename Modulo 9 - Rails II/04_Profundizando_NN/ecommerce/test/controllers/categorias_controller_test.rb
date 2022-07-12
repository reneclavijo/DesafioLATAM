require "test_helper"

class CategoriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria = categorias(:one)
  end

  test "should get index" do
    get categorias_url
    assert_response :success
  end

  test "should get new" do
    get new_categoria_url
    assert_response :success
  end

  test "should create categoria" do
    assert_difference('Categoria.count') do
      post categorias_url, params: { categoria: { nombre: @categoria.nombre } }
    end

    assert_redirected_to categoria_url(Categoria.last)
  end

  test "should show categoria" do
    get categoria_url(@categoria)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoria_url(@categoria)
    assert_response :success
  end

  test "should update categoria" do
    patch categoria_url(@categoria), params: { categoria: { nombre: @categoria.nombre } }
    assert_redirected_to categoria_url(@categoria)
  end

  test "should destroy categoria" do
    assert_difference('Categoria.count', -1) do
      delete categoria_url(@categoria)
    end

    assert_redirected_to categorias_url
  end
end
