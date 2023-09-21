class HomeController < ApplicationController
  def index
    @creatives = CreatorArtist.all
  end
  

  def about
  end
end
