class ApplicationController < ActionController::Base
    # By default these methods are available for controllers
    # To make them available inside the views
    # use this line:
    helper_method :current_user, :logged_in?

    def current_user
        # ||=  --> if current_user has a value return it instead of calling the DB
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # !! --> turns any fn to return boolean
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform this action"
            redirect_to root_path
        end
    end
end
