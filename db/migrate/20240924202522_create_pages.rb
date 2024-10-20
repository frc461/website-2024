class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.json :content

      t.timestamps
    end
  end
end
