require "application_system_test_case"

class HistoryTimesheetsTest < ApplicationSystemTestCase
  setup do
    @history_timesheet = history_timesheets(:one)
  end

  test "visiting the index" do
    visit history_timesheets_url
    assert_selector "h1", text: "History Timesheets"
  end

  test "creating a History timesheet" do
    visit history_timesheets_url
    click_on "New History Timesheet"

    fill_in "Approve by", with: @history_timesheet.approve_by
    fill_in "Approve status", with: @history_timesheet.approve_status_id
    fill_in "Parent timesheet", with: @history_timesheet.parent_timesheet_id
    fill_in "Reject by", with: @history_timesheet.reject_by
    click_on "Create History timesheet"

    assert_text "History timesheet was successfully created"
    click_on "Back"
  end

  test "updating a History timesheet" do
    visit history_timesheets_url
    click_on "Edit", match: :first

    fill_in "Approve by", with: @history_timesheet.approve_by
    fill_in "Approve status", with: @history_timesheet.approve_status_id
    fill_in "Parent timesheet", with: @history_timesheet.parent_timesheet_id
    fill_in "Reject by", with: @history_timesheet.reject_by
    click_on "Update History timesheet"

    assert_text "History timesheet was successfully updated"
    click_on "Back"
  end

  test "destroying a History timesheet" do
    visit history_timesheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "History timesheet was successfully destroyed"
  end
end
