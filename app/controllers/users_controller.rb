class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(username:'...', email:'...', password:'...')
  end
end
