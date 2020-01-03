class ApplicationController < ActionController::Base
    before_action :redirect_user
    helper_method :logged_in?, :logged_in_user
    
    def logged_in?
        !!session[:user_id]
    end

    def redirect_user
        if !logged_in?
            redirect_to login_path
        end
    end
    
    def logged_in_user
        if logged_in?
            User.find(session[:user_id])
        end
    end




end
