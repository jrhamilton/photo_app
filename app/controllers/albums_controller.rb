class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    render 'users/show'
  end

  def create
    @album = Album.new(album_params)
    @user = @album.user
    if @album.save
      flash[:notice] = "Your album name was added!"
      redirect_to :back
    else
      flash[:alert] = "Try again."
      render 'users/show'
    end
  end

  def update
    @album = album.find(params[:id])
    if @album.update(album_params)
      flash[:notice] = "Your album has been updated!"
      redirect_to albums_path
    else
      flash[:alert] = "Try again"
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @photo = Photo.new
    @album = Album.find(params[:id])
  end

  def destroy
    @album = album.find(params[:id])
    @album.destroy
    flash[:notice] = "BOMBS!"
    redirect_to :back
  end

  private

  def album_params
    params.require(:album).permit(:name, :picture, :album_id, :user_id)
  end
end


