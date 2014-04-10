class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to "/users/#{user.slug}"
    else
      flash[:alert] = "Try again!!!!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to "/sessions/new"
  end

private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
