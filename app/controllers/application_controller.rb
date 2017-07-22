class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :clear_session
  before_action :check_step
  before_action :set_cache_headers

  private

  def check_step
    return if request.xhr? || !request.get?

    # 1. if not vehicle selected and not in vehicles/new
    if session[:vehicle_id].nil? &&
       ![new_vehicle_path, root_path].include?(request.path)
      redirect_to root_path

    # 2. if not user selected and not in vehicles/:id or in users/new
    elsif session[:vehicle_id] && session[:user_id].nil? &&
          ![vehicle_path(session[:vehicle_id]), new_user_path].include?(request.path)
      redirect_to vehicle_path(session[:vehicle_id])

    # 3. if not insurance and not in insurances/new
    elsif session[:vehicle_id] && session[:user_id] &&
          session[:insurance_id].nil? && new_insurance_path != request.path
      redirect_to new_insurance_path

    # 4. if insurance bought and not in insurances/:id
    elsif session[:vehicle_id] && session[:user_id] && session[:insurance_id] &&
          (controller_name != 'insurances' || action_name != 'show')
      redirect_to insurance_path(session[:insurance_id])
    end
  end

  def clear_session
    return unless params[:reset]
    session[:user_id] = nil
    session[:vehicle_id] = nil
    session[:insurance_id] = nil
  end

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Sun, 01 Jan 2017 00:00:00 GMT'
  end
end
