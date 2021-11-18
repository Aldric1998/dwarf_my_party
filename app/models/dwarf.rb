class Dwarf < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :picture

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description, :localisation ],
    associated_against: {
      user: [ :name, :surname ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
