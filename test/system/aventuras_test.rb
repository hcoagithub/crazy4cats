require "application_system_test_case"

class AventurasTest < ApplicationSystemTestCase
  setup do
    @aventura = aventuras(:one)
  end

  test "visiting the index" do
    visit aventuras_url
    assert_selector "h1", text: "Aventuras"
  end

  test "should create aventura" do
    visit aventuras_url
    click_on "New aventura"

    fill_in "Country", with: @aventura.country_id
    fill_in "Descripcion", with: @aventura.descripcion
    fill_in "Fecha", with: @aventura.fecha
    fill_in "Imagen", with: @aventura.imagen
    fill_in "Titulo", with: @aventura.titulo
    click_on "Create Aventura"

    assert_text "Aventura was successfully created"
    click_on "Back"
  end

  test "should update Aventura" do
    visit aventura_url(@aventura)
    click_on "Edit this aventura", match: :first

    fill_in "Country", with: @aventura.country_id
    fill_in "Descripcion", with: @aventura.descripcion
    fill_in "Fecha", with: @aventura.fecha
    fill_in "Imagen", with: @aventura.imagen
    fill_in "Titulo", with: @aventura.titulo
    click_on "Update Aventura"

    assert_text "Aventura was successfully updated"
    click_on "Back"
  end

  test "should destroy Aventura" do
    visit aventura_url(@aventura)
    click_on "Destroy this aventura", match: :first

    assert_text "Aventura was successfully destroyed"
  end
end
