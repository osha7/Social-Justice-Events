
class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def logged_in?
        !!current_user
    end

    helper_method :logged_in?

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    helper_method :authentication_required

    def authorize(user)
        #byebug
        redirect_to login_path if user != current_user
        # flash[:error] = "You don't have access to that page!"

    end

    helper_method :authorize
   

end
