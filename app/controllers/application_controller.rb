class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_step

  def check_step
    return if request.xhr? || !request.get?

    if session[:vehicle_id].nil? && controller_name != 'vehicles'
      redirect_to root_path
    elsif session[:vehicle_id] && session[:user_id].nil? && controller_name != 'users'
      redirect_to new_user_path
    elsif session[:vehicle_id] && session[:user_id] && controller_name != 'insurances'
      redirect_to new_insurance_path
    end
  end
end
