class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :insurance

  after_save :emulate_payment

  attr_accessor :card_name, :card_number, :card_expire_on, :card_cvv, :parcels

  validates_presence_of :card_name, :card_number, :card_expire_on, :card_cvv, :parcels

  private

  def emulate_payment
    return if capture_at.present?
    self.capture_at = DateTime.now
    save
    insurance.activate!
  end
end
