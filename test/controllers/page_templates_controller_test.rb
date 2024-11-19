require "test_helper"

class PageTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_template = page_templates(:one)
  end

  test "should get index" do
    get page_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_page_template_url
    assert_response :success
  end

  test "should create page_template" do
    assert_difference("PageTemplate.count") do
      post page_templates_url, params: { page_template: { name: @page_template.name, template: @page_template.template } }
    end

    assert_redirected_to page_template_url(PageTemplate.last)
  end

  test "should show page_template" do
    get page_template_url(@page_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_template_url(@page_template)
    assert_response :success
  end

  test "should update page_template" do
    patch page_template_url(@page_template), params: { page_template: { name: @page_template.name, template: @page_template.template } }
    assert_redirected_to page_template_url(@page_template)
  end

  test "should destroy page_template" do
    assert_difference("PageTemplate.count", -1) do
      delete page_template_url(@page_template)
    end

    assert_redirected_to page_templates_url
  end
end
