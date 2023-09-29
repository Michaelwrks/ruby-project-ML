class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged_out?, :current_creator
    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_creator
    @current_creator ||= CreatorArtist.find(session[:creator_artist_id]) if session[:creator_artist_id]
    end
    
    def logged_in?
     !!current_user
    end

    def logged_out?
     !logged_in?
    end
 
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to login_path
        end
    end
end
