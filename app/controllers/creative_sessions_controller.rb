class CreativeSessionsController < ApplicationController
    def edit
      @creative = CreatorArtist.find(params[:id])
    end
    
    def new
      render 'new'
    end

    def create
      if params[:creator_artist].present? && params[:creator_artist][:username].present? && params[:creator_artist][:password].present?
        creative = CreatorArtist.find_by(username: params[:creator_artist][:username].downcase)
        if creative && creative.authenticate(params[:creator_artist][:password])
          session[:user_id] = creative.id
          flash[:notice] = "Logged in successfully."
          redirect_to root_path
        else
          flash.now[:alert] = "There was something wrong with your login details."
          render 'new'
        end
      end
    end
    

    # def create
    #   if params[:creative_sessions].present? && params[:creative_sessions][:username].present? && params[:creative_sessions][:password].present?
    #     creative = CreatorArtist.find_by(username: params[:creative_sessions][:username].downcase)
    #     if creative && creative.authenticate(params[:creative_sessions][:password])
    #       session[:user_id] = creative.id
    #       flash[:notice] = "Logged in successfully."
    #       redirect_to root_path  # Redirect to the root path
    #     else
    #       flash.now[:alert] = "There was something wrong with your login details."
    #       render 'new'
    #     end
    #   end
    # end
    

    # def create
    #   @creative = CreatorArtist.new(creative_params)
    #   if @creative.save
    #     # Handle successful creation
    #     flash[:notice] = "Account created successfully."
    #     redirect_to root_path
    #   else
    #     # Handle validation errors
    #     render 'new'
    #   end
    # end

    
  

  # def create
  #   if params[:creative_sessions].present? && params[:creative_sessions][:username].present? && params[:creative_sessions][:password].present?
  #     creative = CreatorArtist.find_by(username: params[:creative_sessions][:username].downcase)
  #     if creative && creative.authenticate(params[:creative_sessions][:password])
  #       session[:user_id] = creative.id
  #       flash[:notice] = "Logged in successfully."
  #       redirect_to root_path
  #     else
  #       flash.now[:alert] = "There was something wrong with your login details."
  #       render 'new'
  #     end
  #   end
  # end

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
      params.require(:creator_artist).permit(:username, :email, :password, :image, :description, :category)
    end
  end
    


      
  
  

  