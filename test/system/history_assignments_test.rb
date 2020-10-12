require "application_system_test_case"

class HistoryAssignmentsTest < ApplicationSystemTestCase
  setup do
    @history_assignment = history_assignments(:one)
  end

  test "visiting the index" do
    visit history_assignments_url
    assert_selector "h1", text: "History Assignments"
  end

  test "creating a History assignment" do
    visit history_assignments_url
    click_on "New History Assignment"

    fill_in "Alasan", with: @history_assignment.alasan
    fill_in "By", with: @history_assignment.by
    fill_in "Deskripsi", with: @history_assignment.deskripsi
    fill_in "Info", with: @history_assignment.info
    fill_in "Parent assignment", with: @history_assignment.parent_assignment_id
    fill_in "Status", with: @history_assignment.status
    fill_in "Status info", with: @history_assignment.status_info
    fill_in "Tertuju info", with: @history_assignment.tertuju_info
    click_on "Create History assignment"

    assert_text "History assignment was successfully created"
    click_on "Back"
  end

  test "updating a History assignment" do
    visit history_assignments_url
    click_on "Edit", match: :first

    fill_in "Alasan", with: @history_assignment.alasan
    fill_in "By", with: @history_assignment.by
    fill_in "Deskripsi", with: @history_assignment.deskripsi
    fill_in "Info", with: @history_assignment.info
    fill_in "Parent assignment", with: @history_assignment.parent_assignment_id
    fill_in "Status", with: @history_assignment.status
    fill_in "Status info", with: @history_assignment.status_info
    fill_in "Tertuju info", with: @history_assignment.tertuju_info
    click_on "Update History assignment"

    assert_text "History assignment was successfully updated"
    click_on "Back"
  end

  test "destroying a History assignment" do
    visit history_assignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "History assignment was successfully destroyed"
  end
end
