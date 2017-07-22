# coding: utf-8
ActiveAdmin.register Insurance do
  actions :index, :show

  scope :all, default: true
  scope('Vendidas') { |resource| resource.where('start_on IS NOT NULL') }
  scope('Pendiente pago') { |resource| resource.where('start_on IS NULL') }

  index do
    id_column
    column('Placa') { |i| i.vehicle.registration_number }
    column :start_on
  end

  show do
    panel 'Información vehículo' do
      attributes_table_for insurance do
        row('Placa') { insurance.vehicle.registration_number }
        row('Clase de vehículo') { insurance.vehicle.vehicle_class.name }
        row('Subtipo') { insurance.vehicle.sub_type.name }
        row('Modelo') { insurance.vehicle.release_year }
      end
    end
    panel 'Información poliza' do
      attributes_table_for insurance do
        row :base_value
        row :fosyga_tax
        row :runt_tax
        row :total_value
      end
    end
  end
end
