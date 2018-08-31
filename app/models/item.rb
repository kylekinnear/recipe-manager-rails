class Item < ApplicationRecord
  has_and_belongs_to_many :ingredients
  belongs_to :recipe

  def output
    self.quantity.to_s + " " + self.unit + " " + self.ingredient.name
  end

end
