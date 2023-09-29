class UsersController < ApplicationController
  def show
    @user = User.new(user_params)
    @creator_artists = CreatorArtist.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Sign up successful!'
      redirect_to login_path
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

