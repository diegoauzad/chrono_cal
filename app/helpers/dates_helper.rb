module DatesHelper
  def current_time_zone_name
    session.fetch(:time_zone, 'UTC')
  end

end