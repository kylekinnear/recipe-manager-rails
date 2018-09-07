class Ingredient < ApplicationRecord
  has_many :items
  has_many :recipes, :through => :items

  def self.most_used
    ranker = {}
    self.all.each do |i|
      ranker.store(i, i.recipes.size)
    end
    ranker.max_by{|k,v|, v}[0]
  end

end
