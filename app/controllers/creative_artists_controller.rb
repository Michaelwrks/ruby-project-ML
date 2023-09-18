class CreativeArtistsController < ApplicationController
    # before_action :require_user, only: [:show, :new]
    def show
      # Fetch all creative artists
      @creatives = CreatorArtist.all
    end
  
    def new
      @creative = CreatorArtist.new
    end

    def create
      @creative = CreatorArtist.new(creative_params)
      if @creative.save
    

        redirect_to bio_info_creative_artist_path(@creative), notice: "Creative artist successfully registered!"
      else
        render :new
      end
    end

    def bio_info
      @creative = CreatorArtist.find(params[:id]) 
    end
    
  
    private
  
    def creative_params
      params.require(:creator_artist).permit(:username, :email, :password)
    end
end

  
