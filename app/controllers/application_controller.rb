class ApplicationController < ActionController::Base

  def set_time_zone

    selected_by_user_param = params.fetch(:time_zone_selected_by_user, false)

    # If the time_zone was selected by the user we are getting the simple name (p.e. New York)
    # If not, it's coming from automatic detection stimulus controller so we have to fetch the name
    # from ActiveSupport:TimeZone:MAPPING because we have the full name "America/New_York"
    time_zone_name = selected_by_user_param ? params[:time_zone] : find_time_zone_key(params[:time_zone])

    overrode_by_user = session.fetch(:time_zone_overrode_by_user, false)

    time_zone_name ||= "UTC"

    if session[:time_zone] != time_zone_name && can_update(selected_by_user_param, overrode_by_user)
      session[:time_zone] = time_zone_name
      session[:time_zone_overrode_by_user] = true if selected_by_user_param
      redirect_to(request.referrer || root_path)
    end
  end

  private

  def find_time_zone_key(time_zone_string)
    ActiveSupport::TimeZone::MAPPING.key(time_zone_string) if time_zone_string.present?
  end

  def can_update(selected_by_user_param, overrode_by_user)
    if selected_by_user_param
      true
    elsif !selected_by_user_param && !overrode_by_user
      true
    else
      false
    end
  end

end
