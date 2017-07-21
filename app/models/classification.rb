class Classification < ApplicationRecord
  belongs_to :vehicle_class
  belongs_to :sub_type
end
