class AddPageCategoryIdColumnToPages < ActiveRecord::Migration[7.1]
  def change
    add_reference :pages, :page_category, foreign_key: true
  end
end
