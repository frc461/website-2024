class DashboardController < ApplicationController
  before_action :check_for_user

  def index
  end

  def settings
  end

  def audit_log
    @logs = PaperTrail::Version.all
  end
end
