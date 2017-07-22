class SubTypesController < ApplicationController
  def index
    ids = Classification.where(vehicle_class_id: params[:vehicle_class_id])
                        .pluck(:sub_type_id)
    @sub_types = SubType.where(id: ids)
  end
end
