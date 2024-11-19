require "application_system_test_case"

class PageTemplatesTest < ApplicationSystemTestCase
  setup do
    @page_template = page_templates(:one)
  end

  test "visiting the index" do
    visit page_templates_url
    assert_selector "h1", text: "Page templates"
  end

  test "should create page template" do
    visit page_templates_url
    click_on "New page template"

    fill_in "Name", with: @page_template.name
    fill_in "Template", with: @page_template.template
    click_on "Create Page template"

    assert_text "Page template was successfully created"
    click_on "Back"
  end

  test "should update Page template" do
    visit page_template_url(@page_template)
    click_on "Edit this page template", match: :first

    fill_in "Name", with: @page_template.name
    fill_in "Template", with: @page_template.template
    click_on "Update Page template"

    assert_text "Page template was successfully updated"
    click_on "Back"
  end

  test "should destroy Page template" do
    visit page_template_url(@page_template)
    click_on "Destroy this page template", match: :first

    assert_text "Page template was successfully destroyed"
  end
end
