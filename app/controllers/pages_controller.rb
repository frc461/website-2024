class PagesController < ApplicationController
  before_action :check_for_user, except: :show
  before_action :set_page, only: %i[ show edit update destroy ]

  # GET /pages or /pages.json
  def index
    @pages = policy_scope(Page)
  end

  # GET /pages/1 or /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = authorize Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    @page = authorize Page.new(page_params.merge(html_cache: helpers.render_content(page_params[:content])))

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params.merge(html_cache: helpers.render_content(page_params[:content])))
        format.html { redirect_to page_url(@page), notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy!

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      if params.include? :page_id
        @page_category = policy_scope(PageCategory).friendly.find(params[:id])
        @page = authorize policy_scope(@page_category.pages).friendly.find(params[:page_id])
      else
        @page = authorize policy_scope(Page).friendly.find(params[:id])
        if @page.page_category_id
          @page_category = policy_scope(PageCategory).friendly.find(@page.page_category_id)
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :content, :page_category_id, :draft)
    end
end
