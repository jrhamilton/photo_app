class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
    @users = User.all
    render 'photos/show'
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      flash[:notice] = "Your Favorite was added!"
      redirect_to :back
    else
      flash[:alert] = "Try again."
      render 'photos/show'
    end
  end

  def show
    @photo = Photo.new
    @user = User.find_by(slug: params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :photo_id)
  end
end
