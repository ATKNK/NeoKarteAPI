class PoliticalEra < ApplicationRecord
  belongs_to :country
  belongs_to :dynasty, optional: true
  belongs_to :government_type
  has_many :flags
  has_many :capitals
  has_many :rulers
end
