class Dwarf < ApplicationRecord
  has_many :offers
  has_one_attached :picture
end
