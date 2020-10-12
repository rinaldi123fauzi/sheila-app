require "application_system_test_case"

class ActivityOutputsTest < ApplicationSystemTestCase
  setup do
    @activity_output = activity_outputs(:one)
  end

  test "visiting the index" do
    visit activity_outputs_url
    assert_selector "h1", text: "Activity Outputs"
  end

  test "creating a Activity output" do
    visit activity_outputs_url
    click_on "New Activity Output"

    fill_in "Name", with: @activity_output.name
    click_on "Create Activity output"

    assert_text "Activity output was successfully created"
    click_on "Back"
  end

  test "updating a Activity output" do
    visit activity_outputs_url
    click_on "Edit", match: :first

    fill_in "Name", with: @activity_output.name
    click_on "Update Activity output"

    assert_text "Activity output was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity output" do
    visit activity_outputs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity output was successfully destroyed"
  end
end
