class Item < ApplicationRecord
  attr_accessor :ingredient
  has_and_belongs_to_many :ingredients
  belongs_to :recipe

  def output
    self.quantity.to_s + " " + self.unit + " " + self.ingredient_name
  end

end
