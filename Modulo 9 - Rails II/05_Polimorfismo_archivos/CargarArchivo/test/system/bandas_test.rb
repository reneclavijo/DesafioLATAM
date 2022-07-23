require "application_system_test_case"

class BandasTest < ApplicationSystemTestCase
  setup do
    @banda = bandas(:one)
  end

  test "visiting the index" do
    visit bandas_url
    assert_selector "h1", text: "Bandas"
  end

  test "creating a Banda" do
    visit bandas_url
    click_on "New Banda"

    fill_in "Nombre", with: @banda.nombre
    click_on "Create Banda"

    assert_text "Banda was successfully created"
    click_on "Back"
  end

  test "updating a Banda" do
    visit bandas_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @banda.nombre
    click_on "Update Banda"

    assert_text "Banda was successfully updated"
    click_on "Back"
  end

  test "destroying a Banda" do
    visit bandas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Banda was successfully destroyed"
  end
end
