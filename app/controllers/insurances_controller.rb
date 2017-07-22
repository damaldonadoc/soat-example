class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to new_insurance_path
  end

  # GET /insurances/1
  # GET /insurances/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'soat', layout: 'layouts/pdf.html.erb'
      end
    end
  end

  # GET /insurances/new
  def new
    @insurance = Insurance.new
    @insurance.vehicle_id = session[:vehicle_id]
    @insurance.payment_transaction = Transaction.new
    @insurance.payment_transaction.user_id = session[:user_id]
  end

  # POST /insurances
  # POST /insurances.json
  def create
    @insurance = Insurance.new(insurance_params)

    respond_to do |format|
      if @insurance.save
        session[:insurance_id] = @insurance.id
        format.html { redirect_to @insurance }
        format.json { render :show, status: :created, location: @insurance }
      else
        @insurance.payment_transaction = Transaction.new
        @insurance.vehicle_id = session[:vehicle_id]
        @insurance.payment_transaction.user_id = session[:user_id]

        format.html { render :new }
        format.json do
          render json: @insurance.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_insurance
    @insurance = Insurance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def insurance_params
    params[:insurance][:vehicle_id] = session[:vehicle_id]
    params[:insurance][:payment_transaction_attributes][:user_id] = session[:user_id]
    params.require(:insurance).permit(:vehicle_id,
                                      payment_transaction_attributes:
                                        [:user_id, :card_name, :card_number,
                                         :card_expire_on, :card_cvv, :parcels])
  end
end
