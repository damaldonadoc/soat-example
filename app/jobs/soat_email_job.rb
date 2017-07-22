class SoatEmailJob < ApplicationJob
  queue_as :default

  def perform(insurance_id)
    ApplicationMailer.soat(insurance_id).deliver
  end
end
