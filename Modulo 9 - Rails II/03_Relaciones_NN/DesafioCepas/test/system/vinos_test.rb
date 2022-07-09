require "application_system_test_case"

class VinosTest < ApplicationSystemTestCase
  setup do
    @vino = vinos(:one)
  end

  test "visiting the index" do
    visit vinos_url
    assert_selector "h1", text: "Vinos"
  end

  test "creating a Vino" do
    visit vinos_url
    click_on "New Vino"

    fill_in "Nombre", with: @vino.nombre
    click_on "Create Vino"

    assert_text "Vino was successfully created"
    click_on "Back"
  end

  test "updating a Vino" do
    visit vinos_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @vino.nombre
    click_on "Update Vino"

    assert_text "Vino was successfully updated"
    click_on "Back"
  end

  test "destroying a Vino" do
    visit vinos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vino was successfully destroyed"
  end
end
