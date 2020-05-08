class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?
    helper_method :authorized?

    def current_user    
        @current_user ||= User.find_by(id: session[:user_id])  
    end

    def logged_in?
       !current_user.nil?  
    end

    def authorized?(auth)
      logged_in? && auth.user == current_user
    end
end
