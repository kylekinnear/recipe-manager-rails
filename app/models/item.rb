#require 'active_support/inflector'
#require 'pry'

class Item < ApplicationRecord
  has_and_belongs_to_many :ingredients
  belongs_to :recipe

  #def self.build(quantity, unit, ingredient, recipe)
  #  @item = Item.new
  #  @item.quantity = quantity
  #  @item.unit = unit
  #  binding.pry
  #  @item.ingredient = Ingredient.find_or_create_by(name: ingredient.singularize)
  #  @item.recipe = recipe
  #  @item.save
  #end

  def output
    self.quantity.to_s + " " + self.unit + " " + self.ingredient.name
  end

end
