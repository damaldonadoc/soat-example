class UsersController < ApplicationController
  before_action :set_user, only: :update

  # GET /users
  def index
    redirect_to new_user_path
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html do
        redirect_to new_insurance_path
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
    session[:user_id] = nil
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to new_insurance_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:document_type_id, :document_number, :name, :lastname, :email, :phone)
  end
end
