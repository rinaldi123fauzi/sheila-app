require "application_system_test_case"

class ActivityTitlesTest < ApplicationSystemTestCase
  setup do
    @activity_title = activity_titles(:one)
  end

  test "visiting the index" do
    visit activity_titles_url
    assert_selector "h1", text: "Activity Titles"
  end

  test "creating a Activity title" do
    visit activity_titles_url
    click_on "New Activity Title"

    fill_in "Name", with: @activity_title.name
    click_on "Create Activity title"

    assert_text "Activity title was successfully created"
    click_on "Back"
  end

  test "updating a Activity title" do
    visit activity_titles_url
    click_on "Edit", match: :first

    fill_in "Name", with: @activity_title.name
    click_on "Update Activity title"

    assert_text "Activity title was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity title" do
    visit activity_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity title was successfully destroyed"
  end
end
