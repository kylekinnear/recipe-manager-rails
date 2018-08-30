class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :rating
      t.integer :makes
      t.text :comments
      t.text :recipe_items

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
