class Vehicle < ApplicationRecord
  belongs_to :classification

  def age
    Date.current.year - release_year
  end
end
