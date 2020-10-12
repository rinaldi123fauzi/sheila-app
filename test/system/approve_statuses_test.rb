require "application_system_test_case"

class ApproveStatusesTest < ApplicationSystemTestCase
  setup do
    @approve_status = approve_statuses(:one)
  end

  test "visiting the index" do
    visit approve_statuses_url
    assert_selector "h1", text: "Approve Statuses"
  end

  test "creating a Approve status" do
    visit approve_statuses_url
    click_on "New Approve Status"

    fill_in "Alasan", with: @approve_status.alasan
    fill_in "Approve by", with: @approve_status.approve_by
    fill_in "Deskripsi", with: @approve_status.deskripsi
    fill_in "Info1", with: @approve_status.info1
    fill_in "Info2", with: @approve_status.info2
    fill_in "Info3", with: @approve_status.info3
    fill_in "Info4", with: @approve_status.info4
    fill_in "Infopm", with: @approve_status.infopm
    fill_in "Parent timesheet", with: @approve_status.parent_timesheet_id
    fill_in "Status1", with: @approve_status.status1
    fill_in "Status2", with: @approve_status.status2
    fill_in "Status3", with: @approve_status.status3
    fill_in "Status4", with: @approve_status.status4
    fill_in "Statuspm", with: @approve_status.statuspm
    fill_in "String", with: @approve_status.string
    click_on "Create Approve status"

    assert_text "Approve status was successfully created"
    click_on "Back"
  end

  test "updating a Approve status" do
    visit approve_statuses_url
    click_on "Edit", match: :first

    fill_in "Alasan", with: @approve_status.alasan
    fill_in "Approve by", with: @approve_status.approve_by
    fill_in "Deskripsi", with: @approve_status.deskripsi
    fill_in "Info1", with: @approve_status.info1
    fill_in "Info2", with: @approve_status.info2
    fill_in "Info3", with: @approve_status.info3
    fill_in "Info4", with: @approve_status.info4
    fill_in "Infopm", with: @approve_status.infopm
    fill_in "Parent timesheet", with: @approve_status.parent_timesheet_id
    fill_in "Status1", with: @approve_status.status1
    fill_in "Status2", with: @approve_status.status2
    fill_in "Status3", with: @approve_status.status3
    fill_in "Status4", with: @approve_status.status4
    fill_in "Statuspm", with: @approve_status.statuspm
    fill_in "String", with: @approve_status.string
    click_on "Update Approve status"

    assert_text "Approve status was successfully updated"
    click_on "Back"
  end

  test "destroying a Approve status" do
    visit approve_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Approve status was successfully destroyed"
  end
end
