require 'securerandom'

class User < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true

  has_secure_password

  has_many :recipes

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:name => auth_hash["info"]["nickname"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

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
