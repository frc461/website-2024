class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def history
    @category = PageCategory.friendly.find('history')
    @pages = @category.pages
  end

  def news
    @category = PageCategory.friendly.find('news')
    @pages = @category.pages
  end

  def resources
  end
end
