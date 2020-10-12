require 'test_helper'

class ActivityOutputsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_output = activity_outputs(:one)
  end

  test "should get index" do
    get activity_outputs_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_output_url
    assert_response :success
  end

  test "should create activity_output" do
    assert_difference('ActivityOutput.count') do
      post activity_outputs_url, params: { activity_output: { name: @activity_output.name } }
    end

    assert_redirected_to activity_output_url(ActivityOutput.last)
  end

  test "should show activity_output" do
    get activity_output_url(@activity_output)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_output_url(@activity_output)
    assert_response :success
  end

  test "should update activity_output" do
    patch activity_output_url(@activity_output), params: { activity_output: { name: @activity_output.name } }
    assert_redirected_to activity_output_url(@activity_output)
  end

  test "should destroy activity_output" do
    assert_difference('ActivityOutput.count', -1) do
      delete activity_output_url(@activity_output)
    end

    assert_redirected_to activity_outputs_url
  end
end
