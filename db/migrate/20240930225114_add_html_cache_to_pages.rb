class AddHtmlCacheToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :html_cache, :string
  end
end
