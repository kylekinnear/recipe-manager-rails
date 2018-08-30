class Recipe < ApplicationRecord
  belongs_to :user

  has_many :items
  accepts_nested_attributes_for :items

  has_many :ingredients, :through => :items

  #def build_recipe_items #uses recipe_items attributes to instantiate items and associate them with ingredients
  #  split_items = self.recipe_items.split("\r\n")
  #  split_items.each do |item|
  #    quantity = item.slice(/^\S+/)
  #    item.count(" ") > 1 ? unit = item.slice(/\s\S+\s/).strip : unit = "blank"
  #    ingredient = item.slice(/\s\S+$/).strip
  #    Item.build(quantity, unit, ingredient, self)
  #  end
  #end

end
