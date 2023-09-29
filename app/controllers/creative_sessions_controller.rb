class CreativeSessionsController < ApplicationController
    def edit
      @creative = CreatorArtist.find(params[:id])
    end

    def profile
      if current_creator
        # Check if the request came from the "Inbox" link
        @creative = current_creator

        if request.referer == inbox_path(@creative)
          # Redirect to the inbox if the request came from the "Inbox" link
          redirect_to inbox_path(@creative)
        else
          # Otherwise, render the profile page
          render :profile
        end
      else
        flash[:alert] = "You must be logged in to view your profile."
        redirect_to creative_login_path
      end
    end
  



    def inside
      username = params[:username]
      password = params[:password]

      
    
      creator_artist = CreatorArtist.find_by(username: username)
    
      if creator_artist && creator_artist.authenticate(password)
        puts "is Logged"
        # Redirect to the creator artist's profile page
        session[:creator_artist_id] = creator_artist.id
        redirect_to creative_profile_path(id: creator_artist.id)
      else
        puts "its not logged"
        # If login fails, show an error message (you may want to handle this differently)
        flash[:alert] = "Invalid username or password."
        render :inside
      end
    end
    
    

    def update
      @creative = CreatorArtist.find(params[:id])
      if @creative.update(creative_params)
        redirect_to creative_profile_path
      else
        render :edit
      end
    end

    def destroy
      session[:creator_artist_id] = nil
      flash[:notice] = "You have been logged out."
      redirect_to root_path
    end
    
    private
    
    def creative_params
      params.require(:creator_artist).permit(:username, :email, :password, :image, :description, :category)
    end
    


      
  
  

  end
  


