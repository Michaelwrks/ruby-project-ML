class CreativeArtistsController < ApplicationController

    def show
      @creatives = CreatorArtist.all
    end
  
    def new
      @creative = CreatorArtist.new
    end

    def edit
      @creative = CreatorArtist.find(params[:id])

    end
    

    def create
      @creative = CreatorArtist.new(creative_params)
      if @creative.save
        redirect_to edit_creative_profile_path(@creative)
      else
        render :new
      end
    end
  
    private
  
    def creative_params
      params.require(:creator_artist).permit(:username, :email, :password, :image, :description, :category)
    end
end

  
