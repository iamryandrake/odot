class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      elsif cookies.permanent.signed[:remember_me_token]
        verification = Rails.application.message_verifier(:remember_me_token).verify(cookies.permanent)
        if verification
          Rails.logger.info "Logging in by cookie"
          @current_user ||= User.find(verification)
        end
      end
    end
end
