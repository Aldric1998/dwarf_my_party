class Offer < ApplicationRecord
  belongs_to :dwarf
  belongs_to :user
  has_one :review, dependent: :destroy
end
