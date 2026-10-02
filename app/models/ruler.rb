class Ruler < ApplicationRecord
  belongs_to :era
  belongs_to :person
end
