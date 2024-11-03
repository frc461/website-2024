class AuditLogController < ApplicationController
  before_action :check_for_user
  before_action :set_log, only: %i[ show destroy ]

  def index
    @logs = PaperTrail::Version.all
  end

  def show
  end

  def destroy
  end

  private

  def set_log
    @log = PaperTrail::Version.all.find(params[:id])
  end
end
