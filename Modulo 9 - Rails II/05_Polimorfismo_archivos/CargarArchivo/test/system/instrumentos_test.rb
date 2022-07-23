require "application_system_test_case"

class InstrumentosTest < ApplicationSystemTestCase
  setup do
    @instrumento = instrumentos(:one)
  end

  test "visiting the index" do
    visit instrumentos_url
    assert_selector "h1", text: "Instrumentos"
  end

  test "creating a Instrumento" do
    visit instrumentos_url
    click_on "New Instrumento"

    fill_in "Nombre", with: @instrumento.nombre
    click_on "Create Instrumento"

    assert_text "Instrumento was successfully created"
    click_on "Back"
  end

  test "updating a Instrumento" do
    visit instrumentos_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @instrumento.nombre
    click_on "Update Instrumento"

    assert_text "Instrumento was successfully updated"
    click_on "Back"
  end

  test "destroying a Instrumento" do
    visit instrumentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instrumento was successfully destroyed"
  end
end
