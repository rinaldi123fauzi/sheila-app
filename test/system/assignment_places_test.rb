require "application_system_test_case"

class AssignmentPlacesTest < ApplicationSystemTestCase
  setup do
    @assignment_place = assignment_places(:one)
  end

  test "visiting the index" do
    visit assignment_places_url
    assert_selector "h1", text: "Assignment Places"
  end

  test "creating a Assignment place" do
    visit assignment_places_url
    click_on "New Assignment Place"

    fill_in "Name", with: @assignment_place.name
    click_on "Create Assignment place"

    assert_text "Assignment place was successfully created"
    click_on "Back"
  end

  test "updating a Assignment place" do
    visit assignment_places_url
    click_on "Edit", match: :first

    fill_in "Name", with: @assignment_place.name
    click_on "Update Assignment place"

    assert_text "Assignment place was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignment place" do
    visit assignment_places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignment place was successfully destroyed"
  end
end
