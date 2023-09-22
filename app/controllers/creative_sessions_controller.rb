class CreativeSessionsController < ApplicationController
    def edit
      @creative = CreatorArtist.find(params[:id])
    end

    def create
      creative_artist = CreatorArtist.find_by(username: params[:session][:username])
      if creative_artist && creative_artist.authenticate(params[:session][:password])
        session[:creative_artist_id] = creative_artist.id
        redirect_to creative_profile_path(creative_artist.id)
      else
        flash.now[:error] = 'Invalid email/password combination'
        render :new
      end
    end
    
    private
    
    def creative_params
      params.require(:creator_artist).permit(:image_url, :description, :category)
    end
    


      
  
  

  end
  