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
  end

  def resources
  end

  def safety
  end
end
