require "application_system_test_case"

class CartaTest < ApplicationSystemTestCase
  setup do
    @cartum = carta(:one)
  end

  test "visiting the index" do
    visit carta_url
    assert_selector "h1", text: "Carta"
  end

  test "creating a Cartum" do
    visit carta_url
    click_on "New Cartum"

    fill_in "Descripcion", with: @cartum.descripcion
    fill_in "Nombre", with: @cartum.nombre
    click_on "Create Cartum"

    assert_text "Cartum was successfully created"
    click_on "Back"
  end

  test "updating a Cartum" do
    visit carta_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @cartum.descripcion
    fill_in "Nombre", with: @cartum.nombre
    click_on "Update Cartum"

    assert_text "Cartum was successfully updated"
    click_on "Back"
  end

  test "destroying a Cartum" do
    visit carta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cartum was successfully destroyed"
  end
end
