require 'test_helper'

class HistoryTimesheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_timesheet = history_timesheets(:one)
  end

  test "should get index" do
    get history_timesheets_url
    assert_response :success
  end

  test "should get new" do
    get new_history_timesheet_url
    assert_response :success
  end

  test "should create history_timesheet" do
    assert_difference('HistoryTimesheet.count') do
      post history_timesheets_url, params: { history_timesheet: { approve_by: @history_timesheet.approve_by, approve_status_id: @history_timesheet.approve_status_id, parent_timesheet_id: @history_timesheet.parent_timesheet_id, reject_by: @history_timesheet.reject_by } }
    end

    assert_redirected_to history_timesheet_url(HistoryTimesheet.last)
  end

  test "should show history_timesheet" do
    get history_timesheet_url(@history_timesheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_timesheet_url(@history_timesheet)
    assert_response :success
  end

  test "should update history_timesheet" do
    patch history_timesheet_url(@history_timesheet), params: { history_timesheet: { approve_by: @history_timesheet.approve_by, approve_status_id: @history_timesheet.approve_status_id, parent_timesheet_id: @history_timesheet.parent_timesheet_id, reject_by: @history_timesheet.reject_by } }
    assert_redirected_to history_timesheet_url(@history_timesheet)
  end

  test "should destroy history_timesheet" do
    assert_difference('HistoryTimesheet.count', -1) do
      delete history_timesheet_url(@history_timesheet)
    end

    assert_redirected_to history_timesheets_url
  end
end
