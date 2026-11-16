class EventImage < ApplicationRecord
  belongs_to :historical_event
  has_one_attached :image
end
