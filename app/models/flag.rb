class Flag < ApplicationRecord
  belongs_to :political_era
  has_one_attached :image
end
