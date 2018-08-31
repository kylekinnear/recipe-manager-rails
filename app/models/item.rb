class Item < ApplicationRecord
  attr_accessor :ingredient
#  belongs_to :ingredient
  belongs_to :recipe

  def output
    self.quantity.to_s + " " + self.unit + " " + self.ingredient_name
  end

  def find_or_create_ingredient
    if self.ingredient_name
      self.ingredient = Ingredient.find_or_create_by(name: self.ingredient_name.downcase.singularize)
      self.ingredient_id = self.ingredient.id
      self.save
    end
  end

end
