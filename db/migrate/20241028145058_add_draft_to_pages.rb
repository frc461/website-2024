class AddDraftToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :draft, :boolean
  end
end
