class CreativeArtistsController < ApplicationController

    def show
      @creative = CreatorArtist.find(params[:id])
    end
  
    def new
      @creative = CreatorArtist.new
    end

    def edit
      @creative = CreatorArtist.find(params[:id])

    end

    def view
    end
    

    def create
      @creative = CreatorArtist.new(creative_params)
      if @creative.save
        puts "to profile"
        redirect_to edit_creative_profile_path(@creative)
      else
        puts "not to profile"
        render :new
      end
    end
  
    private
  
    def creative_params
      params.require(:creator_artist).permit(:username, :email, :password, :image, :description, :category)
    end
end

  
