class Recipe < ApplicationRecord
  belongs_to :user

  has_many :items
  accepts_nested_attributes_for :items

  has_many :ingredients, :through => :items

end
