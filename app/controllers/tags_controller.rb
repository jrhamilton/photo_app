class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    @users = User.all
    render "photos/show"
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Your tag name was added!"
      redirect_to :back
    else
      flash[:alert] = "Try again."
      render 'photos/show'
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Your tag has been updated!"
      redirect_to :back
    else
      flash[:alert] = "Try again"
      render 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def show
    @photo = Photo.new
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "BOMBS!"
    redirect_to :back
  end

  private

  def tag_params
    params.require(:tag).permit(:user_id, :photo_id)
  end
end


