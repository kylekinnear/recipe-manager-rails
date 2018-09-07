class Item < ApplicationRecord
  attr_accessor :ingredient
#  belongs_to :ingredient
  belongs_to :recipe

  validate :is_valid_or_blank?

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

  def is_valid_or_blank? #used to make sure an item has a name and quantity or is an empty placeholder
    unless (self.ingredient_name.size > 0 && self.quantity.size > 0) || ( self.ingredient_name == "" && self.quantity == "" && self.unit == "")
      errors.add(:ingredient_name, "Ingredients have both a quantity and a name or are completely blank")
    end
  end

end
