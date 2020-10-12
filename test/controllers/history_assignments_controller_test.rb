require 'test_helper'

class HistoryAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_assignment = history_assignments(:one)
  end

  test "should get index" do
    get history_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_history_assignment_url
    assert_response :success
  end

  test "should create history_assignment" do
    assert_difference('HistoryAssignment.count') do
      post history_assignments_url, params: { history_assignment: { alasan: @history_assignment.alasan, by: @history_assignment.by, deskripsi: @history_assignment.deskripsi, info: @history_assignment.info, parent_assignment_id: @history_assignment.parent_assignment_id, status: @history_assignment.status, status_info: @history_assignment.status_info, tertuju_info: @history_assignment.tertuju_info } }
    end

    assert_redirected_to history_assignment_url(HistoryAssignment.last)
  end

  test "should show history_assignment" do
    get history_assignment_url(@history_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_assignment_url(@history_assignment)
    assert_response :success
  end

  test "should update history_assignment" do
    patch history_assignment_url(@history_assignment), params: { history_assignment: { alasan: @history_assignment.alasan, by: @history_assignment.by, deskripsi: @history_assignment.deskripsi, info: @history_assignment.info, parent_assignment_id: @history_assignment.parent_assignment_id, status: @history_assignment.status, status_info: @history_assignment.status_info, tertuju_info: @history_assignment.tertuju_info } }
    assert_redirected_to history_assignment_url(@history_assignment)
  end

  test "should destroy history_assignment" do
    assert_difference('HistoryAssignment.count', -1) do
      delete history_assignment_url(@history_assignment)
    end

    assert_redirected_to history_assignments_url
  end
end
