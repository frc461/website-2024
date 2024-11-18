class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :set_paper_trail_whodunnit

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def admin?
    current_user&.admin
  end

  def check_for_user
    redirect_to root_path, notice: "You must be logged in to do that" unless current_user
  end

  def check_for_admin
    redirect_to root_path, notice: "You are not allowed to do that" unless admin?
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back_or_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
  end
end
