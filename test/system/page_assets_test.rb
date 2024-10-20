require "application_system_test_case"

class PageAssetsTest < ApplicationSystemTestCase
  setup do
    @page_asset = page_assets(:one)
  end

  test "visiting the index" do
    visit page_assets_url
    assert_selector "h1", text: "Page assets"
  end

  test "should create page asset" do
    visit page_assets_url
    click_on "New page asset"

    fill_in "Page", with: @page_asset.page_id
    click_on "Create Page asset"

    assert_text "Page asset was successfully created"
    click_on "Back"
  end

  test "should update Page asset" do
    visit page_asset_url(@page_asset)
    click_on "Edit this page asset", match: :first

    fill_in "Page", with: @page_asset.page_id
    click_on "Update Page asset"

    assert_text "Page asset was successfully updated"
    click_on "Back"
  end

  test "should destroy Page asset" do
    visit page_asset_url(@page_asset)
    click_on "Destroy this page asset", match: :first

    assert_text "Page asset was successfully destroyed"
  end
end
