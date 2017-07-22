class VehiclesController < ApplicationController
  before_action :set_vehicle, only: :show

  # GET /vehicles
  def index
    redirect_to new_vehicle_path
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @insurance = Insurance.new
    @insurance.vehicle = @vehicle
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @vehicle_classes = VehicleClass.all
    session[:vehicle_id] = nil
    session[:user_id] = nil
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        session[:vehicle_id] = @vehicle.id
        format.html { redirect_to @vehicle }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        @vehicle_classes = VehicleClass.all
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params[:vehicle][:classification_id] = Classification.find_by(
      vehicle_class_id: params[:vehicle][:vehicle_class],
      sub_type_id: params[:vehicle][:sub_type]).try(:id)
    params.require(:vehicle).permit(:registration_number, :classification_id, :release_year)
  end
end
