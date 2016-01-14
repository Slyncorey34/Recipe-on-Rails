class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :body
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
