class Portrait < ApplicationRecord
  belongs_to :ruler
  has_one_attached :image
end
