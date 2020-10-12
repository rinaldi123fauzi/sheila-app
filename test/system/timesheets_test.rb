require "application_system_test_case"

class TimesheetsTest < ApplicationSystemTestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "visiting the index" do
    visit timesheets_url
    assert_selector "h1", text: "Timesheets"
  end

  test "creating a Timesheet" do
    visit timesheets_url
    click_on "New Timesheet"

    fill_in "Activity output", with: @timesheet.activity_output_id
    fill_in "Activity title", with: @timesheet.activity_title_id
    fill_in "Isi aktivitas", with: @timesheet.isi_aktivitas
    fill_in "Jam mulai", with: @timesheet.jam_mulai
    fill_in "Jam selesai", with: @timesheet.jam_selesai
    fill_in "Lokasi kerja", with: @timesheet.lokasi_kerja
    fill_in "Parent", with: @timesheet.parent_id
    fill_in "Tanggal", with: @timesheet.tanggal
    fill_in "User", with: @timesheet.user_id
    click_on "Create Timesheet"

    assert_text "Timesheet was successfully created"
    click_on "Back"
  end

  test "updating a Timesheet" do
    visit timesheets_url
    click_on "Edit", match: :first

    fill_in "Activity output", with: @timesheet.activity_output_id
    fill_in "Activity title", with: @timesheet.activity_title_id
    fill_in "Isi aktivitas", with: @timesheet.isi_aktivitas
    fill_in "Jam mulai", with: @timesheet.jam_mulai
    fill_in "Jam selesai", with: @timesheet.jam_selesai
    fill_in "Lokasi kerja", with: @timesheet.lokasi_kerja
    fill_in "Parent", with: @timesheet.parent_id
    fill_in "Tanggal", with: @timesheet.tanggal
    fill_in "User", with: @timesheet.user_id
    click_on "Update Timesheet"

    assert_text "Timesheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Timesheet" do
    visit timesheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timesheet was successfully destroyed"
  end
end
