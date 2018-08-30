class Recipe < ApplicationRecord
  belongs_to :user

  has_many :items
  has_many :ingredients, :through => :items
end
