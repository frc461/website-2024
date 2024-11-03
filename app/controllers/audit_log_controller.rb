class AuditLogController < ApplicationController
  before_action :check_for_user
  before_action :check_for_admin, only: :destroy
  before_action :set_log, only: %i[ show destroy ]

  def index
    @logs = PaperTrail::Version.all
  end

  def show
  end

  def destroy
    @log.destroy!

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_log
    @log = PaperTrail::Version.all.find(params[:id])
  end
end
