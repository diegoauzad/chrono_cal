class ApplicationController < ActionController::Base

  def set_timezone
    if params[:timezone].present? && session[:timezone] != params[:timezone]
      session[:timezone] = params[:timezone]
      # Redirect or render only if timezone is updated
      redirect_to(request.referrer || root_path)
    else
      # Prevent loop by not redirecting or rendering
      head :no_content
    end
  end

end
