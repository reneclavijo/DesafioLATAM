require "application_system_test_case"

class CepasTest < ApplicationSystemTestCase
  setup do
    @cepa = cepas(:one)
  end

  test "visiting the index" do
    visit cepas_url
    assert_selector "h1", text: "Cepas"
  end

  test "creating a Cepa" do
    visit cepas_url
    click_on "New Cepa"

    fill_in "Nombre", with: @cepa.nombre
    click_on "Create Cepa"

    assert_text "Cepa was successfully created"
    click_on "Back"
  end

  test "updating a Cepa" do
    visit cepas_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @cepa.nombre
    click_on "Update Cepa"

    assert_text "Cepa was successfully updated"
    click_on "Back"
  end

  test "destroying a Cepa" do
    visit cepas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cepa was successfully destroyed"
  end
end
