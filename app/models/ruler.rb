class Ruler < ApplicationRecord
  belongs_to :political_era
  belongs_to :person
  has_one :portrait
end
