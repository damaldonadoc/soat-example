class SystemParam < ApplicationRecord
  scope :active, ->{ where(state: 'active') }

  def value
    case value_type
    when 'currency'
      self[:value].to_f
    when 'percent'
      self[:value].to_f / 100
    else
      self[:value]
    end
  end
end
