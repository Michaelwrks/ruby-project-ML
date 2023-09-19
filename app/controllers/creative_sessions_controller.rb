class CreativeSessionsController < ApplicationController
    def edit
      @creative = CreatorArtist.find(params[:id])
    end

    def update
      @creative = CreatorArtist.find(params[:id])
      if @creative.update(creative_params)
        # Redirect to a profile path if i've got time for now back to home
        redirect_to root_path
      else
        flash.now[:error] = "Please correct the errors below." 
        render :edit 
      end
    end
    
    private
    
    def creative_params
      params.require(:creator_artist).permit(:image_url, :description, :category)
    end
    


      
  
  

  end
  