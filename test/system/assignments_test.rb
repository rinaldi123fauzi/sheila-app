require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  setup do
    @assignment = assignments(:one)
  end

  test "visiting the index" do
    visit assignments_url
    assert_selector "h1", text: "Assignments"
  end

  test "creating a Assignment" do
    visit assignments_url
    click_on "New Assignment"

    fill_in "Lama penugasan", with: @assignment.lama_penugasan
    fill_in "Lokasi kerja", with: @assignment.lokasi_kerja
    fill_in "Nama", with: @assignment.nama
    fill_in "Pihak ketiga", with: @assignment.pihak_ketiga
    fill_in "Position", with: @assignment.position_id
    fill_in "Satuan kerja", with: @assignment.satuan_kerja
    fill_in "Service type", with: @assignment.service_type_id
    fill_in "Spesifik output", with: @assignment.spesifik_output
    click_on "Create Assignment"

    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "updating a Assignment" do
    visit assignments_url
    click_on "Edit", match: :first

    fill_in "Lama penugasan", with: @assignment.lama_penugasan
    fill_in "Lokasi kerja", with: @assignment.lokasi_kerja
    fill_in "Nama", with: @assignment.nama
    fill_in "Pihak ketiga", with: @assignment.pihak_ketiga
    fill_in "Position", with: @assignment.position_id
    fill_in "Satuan kerja", with: @assignment.satuan_kerja
    fill_in "Service type", with: @assignment.service_type_id
    fill_in "Spesifik output", with: @assignment.spesifik_output
    click_on "Update Assignment"

    assert_text "Assignment was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignment" do
    visit assignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignment was successfully destroyed"
  end
end
