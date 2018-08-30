class User < ApplicationRecord

  has_secure_password

  has_many :recipes
  has_many :ingredients, :through => :recipes #does this work, since we're skipping items?
end
