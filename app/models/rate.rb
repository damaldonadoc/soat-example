class Rate < ApplicationRecord
  belongs_to :classification
  belongs_to :age_range
end
