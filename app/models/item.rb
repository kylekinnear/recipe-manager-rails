class Item < ApplicationRecord
  has_and_belongs_to_many :ingredients

  def output
    self.quantity.to_s + " " self.unit + " " + self.ingredient.name
  end
end
