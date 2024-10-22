class AddSlugToPageCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :page_categories, :slug, :string
    add_index :page_categories, :slug, unique: true
  end
end
