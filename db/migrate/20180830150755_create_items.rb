class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :ingredient, foreign_key: true
      t.belongs_to :recipe, foreign_key: true

      t.string :quantity
      t.string :unit
      t.string :ingredient_name

      t.timestamps
    end
  end
end
