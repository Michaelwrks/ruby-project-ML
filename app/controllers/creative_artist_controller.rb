class CreativeArtistController < ApplicationController
    def show
        @creative_user = Creator.new(user_params)
      end
    def new
        @creative_user = Creator.new
    end
end
