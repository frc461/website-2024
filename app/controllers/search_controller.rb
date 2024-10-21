class SearchController < ApplicationController
  def index
    @results = policy_scope(Page).ransack(title_or_html_cache_cont: params[:q]).result
  end
end
