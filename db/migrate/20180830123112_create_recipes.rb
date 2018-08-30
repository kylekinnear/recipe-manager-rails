class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :rating
      t.integer :makes
      t.string :comments

      t.timestamps
    end
  end
end
