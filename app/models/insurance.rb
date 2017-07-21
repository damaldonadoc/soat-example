class Insurance < ApplicationRecord
  belongs_to :vehicle

  def base_value
    rate_params = {}
    rate_params[:classification_id] = vehicle.classification.id

    if vehicle.classification.vehicle_class.has_age
      rate_params[:age_range_id] = AgeRange.where('? BETWEEN min AND max',
                                                  vehicle.age)
    end

    rate_value = Rate.find_by(rate_params).value
    smdlv_value = SystemParam.active.find_by(key: 'smdlv').value

    (rate_value * smdlv_value).to_i.floor(-2)
  end

  def fosyga_tax
    fosyga_value = SystemParam.active.find_by(key: 'fosyga').value
    (base_value * fosyga_value).to_i
  end

  def subtotal_value
    (base_value + fosyga_tax).to_i
  end

  def runt_tax
    SystemParam.active.find_by(key: 'runt').value.to_i
  end

  def total_value
    (subtotal_value + runt_tax).to_i
  end
end
