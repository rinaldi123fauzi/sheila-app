require 'test_helper'

class AssignmentPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment_place = assignment_places(:one)
  end

  test "should get index" do
    get assignment_places_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_place_url
    assert_response :success
  end

  test "should create assignment_place" do
    assert_difference('AssignmentPlace.count') do
      post assignment_places_url, params: { assignment_place: { name: @assignment_place.name } }
    end

    assert_redirected_to assignment_place_url(AssignmentPlace.last)
  end

  test "should show assignment_place" do
    get assignment_place_url(@assignment_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_place_url(@assignment_place)
    assert_response :success
  end

  test "should update assignment_place" do
    patch assignment_place_url(@assignment_place), params: { assignment_place: { name: @assignment_place.name } }
    assert_redirected_to assignment_place_url(@assignment_place)
  end

  test "should destroy assignment_place" do
    assert_difference('AssignmentPlace.count', -1) do
      delete assignment_place_url(@assignment_place)
    end

    assert_redirected_to assignment_places_url
  end
end
