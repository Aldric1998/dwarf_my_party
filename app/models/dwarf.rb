class Dwarf < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :picture
end
