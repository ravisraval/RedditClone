class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    helper_method :current_user, :require_signed_in

    def current_user
      @current_user ||= User.find_by_session_token(session[:session_token])
      # return @current_user if @current_user
      # nil
    end

    def require_signed_in
      redirect_to new_session_url unless current_user
    end

end
