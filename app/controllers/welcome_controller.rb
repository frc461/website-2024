class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def history
    @category = policy_scope(PageCategory).friendly.find('history')
    @pages = policy_scope(@category.pages)
  end

  def news
    @category = policy_scope(PageCategory).friendly.find('news')
    @pages = policy_scope(@category.pages)
  end

  def resources
  end
end
