class HomeController < ApplicationController
  def index
    @creatives = CreatorArtist.all
    @user = current_user
  end
  
  def about
  end
end
