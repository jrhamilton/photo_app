class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update(:slug => ("#{@user.name}").parameterize)
      flash[:notice] = "Your user name was created!"
      redirect_to "/users/#{@user.slug}"
    else
      flash[:alert] = "Try again."
      render 'new'
    end
  end

  def show
    @album = Album.new
    @photo = Photo.new
    @user = User.find_by(slug: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.update(:slug => ("#{@user.name}").parameterize)
      flash[:notice] = "Your user has been updated!"
      redirect_to "/users/#{@user.slug}"
    else
      flash[:alert] = "Try again"
      render 'new'
    end
  end

  def edit
    @user = User.find_by(slug: params[:id])
  end

  def destroy
    @user = User.find_by(slug: params[:id])
    @user.destroy
    flash[:notice] = "BOMBS!"
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :slug, :avatar)
  end
end
