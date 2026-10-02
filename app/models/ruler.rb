class Ruler < ApplicationRecord
  belongs_to :political_era
  belongs_to :person
end
