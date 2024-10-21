class WelcomeController < ApplicationController
  before_action :check_for_user, only: :dashboard

  def index
  end

  def dashboard
  end
end
