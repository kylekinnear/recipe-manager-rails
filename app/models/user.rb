require 'securerandom'

class User < ApplicationRecord

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  has_secure_password

  has_many :recipes
  #has_many :ingredients, :through => :recipes #does this work, since we're skipping items?

  def highest_rated
    ranker = {}
    self.recipes.each do |r|
      if r.rating != nil
        ranker.store(r, r.rating)
      end
    end
    ranker.max_by{|k,v| v}[0]
  end

  def most_made
    ranker = {}
    self.recipes.each do |r|
      if r.makes != nil
        ranker.store(r, r.makes)
      end
    end
    ranker.max_by{|k,v| v}[0]
  end

  def serves_most
    ranker = {}
    self.recipes.each do |r|
      if r.serves != nil
        ranker.store(r, r.serves)
      end
    end
    ranker.max_by{|k,v| v}[0]
  end

end
