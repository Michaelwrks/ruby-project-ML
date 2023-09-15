class CreativeArtistController < ApplicationController
    before_action :require_user, only: [:show, :new]
    def show
      # Fetch all creative artists
      @creatives = CreatorArtist.all
    end
  
    def new
      @creative = CreatorArtist.new
    end
end
  
