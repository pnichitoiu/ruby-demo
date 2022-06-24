class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html { redirect_to user_path(user.id)}
      else
        format.html { redirect_to login_path, alert: "Your email or password is incorrect!" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end