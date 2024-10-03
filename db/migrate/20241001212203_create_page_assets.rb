class CreatePageAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :page_assets do |t|
      t.belongs_to :page, foreign_key: true

      t.timestamps
    end
  end
end
