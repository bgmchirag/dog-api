class Dog < ApplicationRecord

  has_many :images
  validates :breed, presence: true
  validates :breed, uniqueness: true

end
