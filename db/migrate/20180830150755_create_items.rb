class Item < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :unit
      t.name :ingredient

      t.timestamps
    end
  end
end
