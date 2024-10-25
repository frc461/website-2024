require "application_system_test_case"

class PageCategoriesTest < ApplicationSystemTestCase
  setup do
    @page_category = page_categories(:one)
  end

  test "visiting the index" do
    visit page_categories_url
    assert_selector "h1", text: "Page categories"
  end

  test "should create page category" do
    visit page_categories_url
    click_on "New page category"

    fill_in "Name", with: @page_category.name
    click_on "Create Page category"

    assert_text "Page category was successfully created"
    click_on "Back"
  end

  test "should update Page category" do
    visit page_category_url(@page_category)
    click_on "Edit this page category", match: :first

    fill_in "Name", with: @page_category.name
    click_on "Update Page category"

    assert_text "Page category was successfully updated"
    click_on "Back"
  end

  test "should destroy Page category" do
    visit page_category_url(@page_category)
    click_on "Destroy this page category", match: :first

    assert_text "Page category was successfully destroyed"
  end
end
