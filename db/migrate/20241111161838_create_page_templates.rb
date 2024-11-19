class CreatePageTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :page_templates do |t|
      t.string :name
      t.json :template

      t.timestamps
    end
  end
end
