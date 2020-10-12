require 'test_helper'

class ApproveStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @approve_status = approve_statuses(:one)
  end

  test "should get index" do
    get approve_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_approve_status_url
    assert_response :success
  end

  test "should create approve_status" do
    assert_difference('ApproveStatus.count') do
      post approve_statuses_url, params: { approve_status: { alasan: @approve_status.alasan, approve_by: @approve_status.approve_by, deskripsi: @approve_status.deskripsi, info1: @approve_status.info1, info2: @approve_status.info2, info3: @approve_status.info3, info4: @approve_status.info4, infopm: @approve_status.infopm, parent_timesheet_id: @approve_status.parent_timesheet_id, status1: @approve_status.status1, status2: @approve_status.status2, status3: @approve_status.status3, status4: @approve_status.status4, statuspm: @approve_status.statuspm, string: @approve_status.string } }
    end

    assert_redirected_to approve_status_url(ApproveStatus.last)
  end

  test "should show approve_status" do
    get approve_status_url(@approve_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_approve_status_url(@approve_status)
    assert_response :success
  end

  test "should update approve_status" do
    patch approve_status_url(@approve_status), params: { approve_status: { alasan: @approve_status.alasan, approve_by: @approve_status.approve_by, deskripsi: @approve_status.deskripsi, info1: @approve_status.info1, info2: @approve_status.info2, info3: @approve_status.info3, info4: @approve_status.info4, infopm: @approve_status.infopm, parent_timesheet_id: @approve_status.parent_timesheet_id, status1: @approve_status.status1, status2: @approve_status.status2, status3: @approve_status.status3, status4: @approve_status.status4, statuspm: @approve_status.statuspm, string: @approve_status.string } }
    assert_redirected_to approve_status_url(@approve_status)
  end

  test "should destroy approve_status" do
    assert_difference('ApproveStatus.count', -1) do
      delete approve_status_url(@approve_status)
    end

    assert_redirected_to approve_statuses_url
  end
end
