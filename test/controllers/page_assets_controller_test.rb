require "test_helper"

class PageAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_asset = page_assets(:one)
  end

  test "should get index" do
    get page_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_page_asset_url
    assert_response :success
  end

  test "should create page_asset" do
    assert_difference("PageAsset.count") do
      post page_assets_url, params: { page_asset: { page_id: @page_asset.page_id } }
    end

    assert_redirected_to page_asset_url(PageAsset.last)
  end

  test "should show page_asset" do
    get page_asset_url(@page_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_asset_url(@page_asset)
    assert_response :success
  end

  test "should update page_asset" do
    patch page_asset_url(@page_asset), params: { page_asset: { page_id: @page_asset.page_id } }
    assert_redirected_to page_asset_url(@page_asset)
  end

  test "should destroy page_asset" do
    assert_difference("PageAsset.count", -1) do
      delete page_asset_url(@page_asset)
    end

    assert_redirected_to page_assets_url
  end
end
