class PoliticalEra < ApplicationRecord
  belongs_to :country
  belongs_to :dynasty
  belongs_to :government_type
end
