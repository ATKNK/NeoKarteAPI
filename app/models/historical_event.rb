class HistoricalEvent < ApplicationRecord
  has_many :event_images, dependent: :destroy
end
