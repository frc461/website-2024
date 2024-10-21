class PageAssetsController < ApplicationController
  before_action :set_page_asset, only: %i[ show destroy ]
  before_action :check_for_user, only: %i[ index show destroy upload_image ]

  # GET /page_assets or /page_assets.json
  def index
    @page_assets = PageAsset.all
  end

  # GET /page_assets/1 or /page_assets/1.json
  def show
  end

  # DELETE /page_assets/1 or /page_assets/1.json
  def destroy
    authorize @page_asset
    @page_asset.destroy!

    respond_to do |format|
      format.html { redirect_to page_assets_url, notice: "Page asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upload_image
    image = params[:image]

    if image.nil?
      render json: { success: 0, error: "No image found in request" }
      return
    end

    uploaded_image = PageAsset.create!(asset: image)
    image_url = rails_blob_url(uploaded_image.asset)

    render json: { success: 1, file: { url: image_url } }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_asset
      @page_asset = PageAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_asset_params
      params.require(:page_asset).permit(:page_id)
    end
end
