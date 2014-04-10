class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    render 'users/show'
  end

  def create
    @photo = Photo.new(photo_params)
    @album = @photo.album
    @user = @album.user
    if @photo.save
      flash[:notice] = "Your photo name was added!"
      redirect_to :back
    else
      flash[:alert] = "Try again."
      render 'albums/show'
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "Your photo has been updated!"
      redirect_to :back
    else
      flash[:alert] = "Try again"
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def show
    @tag = Tag.new
    @favorite = Favorite.new
    @photo = Photo.find(params[:id])
    @album = Album.find(@photo.album_id)
    @user = User.find(@album.user_id)
    @has_photo = Favorite.has_photo({:user_id => @user.id, :photo_id => @photo.id})
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "BOMBS!"
    redirect_to :back
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :picture, :album_id, :user_id)
  end
end
