require "test_helper"

class PageCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_category = page_categories(:one)
  end

  test "should get index" do
    get page_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_page_category_url
    assert_response :success
  end

  test "should create page_category" do
    assert_difference("PageCategory.count") do
      post page_categories_url, params: { page_category: { name: @page_category.name } }
    end

    assert_redirected_to page_category_url(PageCategory.last)
  end

  test "should show page_category" do
    get page_category_url(@page_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_category_url(@page_category)
    assert_response :success
  end

  test "should update page_category" do
    patch page_category_url(@page_category), params: { page_category: { name: @page_category.name } }
    assert_redirected_to page_category_url(@page_category)
  end

  test "should destroy page_category" do
    assert_difference("PageCategory.count", -1) do
      delete page_category_url(@page_category)
    end

    assert_redirected_to page_categories_url
  end
end
