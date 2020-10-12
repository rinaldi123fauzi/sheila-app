require "application_system_test_case"

class PersonilDetailsTest < ApplicationSystemTestCase
  setup do
    @personil_detail = personil_details(:one)
  end

  test "visiting the index" do
    visit personil_details_url
    assert_selector "h1", text: "Personil Details"
  end

  test "creating a Personil detail" do
    visit personil_details_url
    click_on "New Personil Detail"

    fill_in "Assignment place", with: @personil_detail.assignment_place_id
    fill_in "Email", with: @personil_detail.email
    fill_in "Nama lengkap", with: @personil_detail.nama_lengkap
    fill_in "Nama panggilan", with: @personil_detail.nama_panggilan
    fill_in "Nomor ponsel", with: @personil_detail.nomor_ponsel
    fill_in "Position", with: @personil_detail.position_id
    fill_in "Tim", with: @personil_detail.tim
    fill_in "User", with: @personil_detail.user_id
    click_on "Create Personil detail"

    assert_text "Personil detail was successfully created"
    click_on "Back"
  end

  test "updating a Personil detail" do
    visit personil_details_url
    click_on "Edit", match: :first

    fill_in "Assignment place", with: @personil_detail.assignment_place_id
    fill_in "Email", with: @personil_detail.email
    fill_in "Nama lengkap", with: @personil_detail.nama_lengkap
    fill_in "Nama panggilan", with: @personil_detail.nama_panggilan
    fill_in "Nomor ponsel", with: @personil_detail.nomor_ponsel
    fill_in "Position", with: @personil_detail.position_id
    fill_in "Tim", with: @personil_detail.tim
    fill_in "User", with: @personil_detail.user_id
    click_on "Update Personil detail"

    assert_text "Personil detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Personil detail" do
    visit personil_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personil detail was successfully destroyed"
  end
end
