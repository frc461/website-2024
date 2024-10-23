class PageCategoriesController < ApplicationController
  before_action :set_page_category, only: %i[ show edit update destroy ]
  before_action :check_for_user

  # GET /page_categories or /page_categories.json
  def index
    @page_categories = policy_scope(PageCategory)
  end

  # GET /page_categories/1 or /page_categories/1.json
  def show
  end

  # GET /page_categories/new
  def new
    @page_category = authorize PageCategory.new
  end

  # GET /page_categories/1/edit
  def edit
  end

  # POST /page_categories or /page_categories.json
  def create
    @page_category = authorize PageCategory.new(page_category_params)

    respond_to do |format|
      if @page_category.save
        format.html { redirect_to page_categories_url, notice: "Page category was successfully created." }
        format.json { render :show, status: :created, location: @page_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_categories/1 or /page_categories/1.json
  def update
    respond_to do |format|
      if @page_category.update(page_category_params)
        format.html { redirect_to page_categories_url, notice: "Page category was successfully updated." }
        format.json { render :show, status: :ok, location: @page_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_categories/1 or /page_categories/1.json
  def destroy
    @page_category.destroy!

    respond_to do |format|
      format.html { redirect_to page_categories_url, notice: "Page category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_category
      @page_category = authorize policy_scope(PageCategory).friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_category_params
      params.require(:page_category).permit(:name)
    end
end
