class SearchController < ApplicationController
  def index
    pages = policy_scope(Page).ransack(title_or_html_cache_cont: params[:q]).result
    users = policy_scope(User).ransack(name_cont: params[:q]).result
    @results = pages + users
  end
end
