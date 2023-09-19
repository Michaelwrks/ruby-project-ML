class HomeController < ApplicationController
  def index
    @creatives = CreatorArtist.all
  end
end
