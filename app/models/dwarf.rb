class Dwarf < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :picture
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?
end
