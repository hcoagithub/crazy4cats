require "test_helper"

class AventurasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aventura = aventuras(:one)
  end

  test "should get index" do
    get aventuras_url
    assert_response :success
  end

  test "should get new" do
    get new_aventura_url
    assert_response :success
  end

  test "should create aventura" do
    assert_difference("Aventura.count") do
      post aventuras_url, params: { aventura: { country_id: @aventura.country_id, descripcion: @aventura.descripcion, fecha: @aventura.fecha, imagen: @aventura.imagen, titulo: @aventura.titulo } }
    end

    assert_redirected_to aventura_url(Aventura.last)
  end

  test "should show aventura" do
    get aventura_url(@aventura)
    assert_response :success
  end

  test "should get edit" do
    get edit_aventura_url(@aventura)
    assert_response :success
  end

  test "should update aventura" do
    patch aventura_url(@aventura), params: { aventura: { country_id: @aventura.country_id, descripcion: @aventura.descripcion, fecha: @aventura.fecha, imagen: @aventura.imagen, titulo: @aventura.titulo } }
    assert_redirected_to aventura_url(@aventura)
  end

  test "should destroy aventura" do
    assert_difference("Aventura.count", -1) do
      delete aventura_url(@aventura)
    end

    assert_redirected_to aventuras_url
  end
end
