class Recipe < ApplicationRecord

  validates :name, presence: true
  validate :has_an_ingredient?

  belongs_to :user

  has_many :items
  accepts_nested_attributes_for :items

  has_many :ingredients, :through => :items

  def has_an_ingredient?
    if self.items.first.name.nil?
      errors.add(:items, "You need at least 1 ingredient")
    else
      unless !!(self.ingredient_name =~ /[a-zA-Z]/)
        errors.add(:items, "Your ingredient needs some letters")
      end
    end
  end

end
