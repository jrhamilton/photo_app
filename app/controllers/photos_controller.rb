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
    if @photo.save
      flash[:notice] = "Your photo name was added!"
      redirect_to :back
    else
      flash[:alert] = "Try again."
      render 'users/show'
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "Your photo has been updated!"
      redirect_to photos_path
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
    @photo = Photo.find(params[:id])
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
