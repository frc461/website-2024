class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def admin?
    current_user&.admin
  end

  def check_for_user
    redirect_to root_path, notice: 'You must be logged in to do that' unless current_user
  end

  def check_for_admin
    redirect_to root_path, notice: 'You are not allowed to do that' unless admin?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
  end
end
