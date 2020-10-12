require 'test_helper'

class ActivityTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_title = activity_titles(:one)
  end

  test "should get index" do
    get activity_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_title_url
    assert_response :success
  end

  test "should create activity_title" do
    assert_difference('ActivityTitle.count') do
      post activity_titles_url, params: { activity_title: { name: @activity_title.name } }
    end

    assert_redirected_to activity_title_url(ActivityTitle.last)
  end

  test "should show activity_title" do
    get activity_title_url(@activity_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_title_url(@activity_title)
    assert_response :success
  end

  test "should update activity_title" do
    patch activity_title_url(@activity_title), params: { activity_title: { name: @activity_title.name } }
    assert_redirected_to activity_title_url(@activity_title)
  end

  test "should destroy activity_title" do
    assert_difference('ActivityTitle.count', -1) do
      delete activity_title_url(@activity_title)
    end

    assert_redirected_to activity_titles_url
  end
end
