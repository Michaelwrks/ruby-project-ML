class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged_out?, :current_creative, :creative_logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

   
    def current_creative
        @current_creative ||= CreatorArtist.find(session[:creative_artist_id]) if session[:creative_artist_id]
    end
      

    def creative_logged_in?
        !!current_creative
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
