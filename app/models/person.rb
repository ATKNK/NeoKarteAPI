class Person < ApplicationRecord
  belongs_to :dynasty, optional: true
end
