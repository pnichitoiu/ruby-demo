class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfuly."
      redirect_to user_path(user.id)
    else
      flash.now[:alert] = "Your email or password is incorrect!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "you have been logged out."
    redirect_to root_path
  end

end