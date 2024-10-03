class PageAssetsController < ApplicationController
  before_action :set_page_asset, only: %i[ show edit update destroy ]

  # GET /page_assets or /page_assets.json
  def index
    @page_assets = PageAsset.all
  end

  # GET /page_assets/1 or /page_assets/1.json
  def show
  end

  # GET /page_assets/new
  def new
    @page_asset = PageAsset.new
  end

  # GET /page_assets/1/edit
  def edit
  end

  # POST /page_assets or /page_assets.json
  def create
    @page_asset = PageAsset.new(page_asset_params)

    respond_to do |format|
      if @page_asset.save
        format.html { redirect_to page_asset_url(@page_asset), notice: "Page asset was successfully created." }
        format.json { render :show, status: :created, location: @page_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_assets/1 or /page_assets/1.json
  def update
    respond_to do |format|
      if @page_asset.update(page_asset_params)
        format.html { redirect_to page_asset_url(@page_asset), notice: "Page asset was successfully updated." }
        format.json { render :show, status: :ok, location: @page_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_assets/1 or /page_assets/1.json
  def destroy
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
