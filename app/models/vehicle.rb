class Vehicle < ApplicationRecord
  belongs_to :classification
  has_one :vehicle_class, through: :classification
  has_one :sub_type, through: :classification
  has_many :insurances

  validates :registration_number, presence: true
  validates_uniqueness_of :registration_number

  def age
    Date.current.year - release_year
  end

  def soat_expires_on
    last_insurance = insurances.where('start_on IS NOT NULL')
                               .order(start_on: :desc).first
    last_insurance.start_on + last_insurance.coverage_period if last_insurance
  end
end
