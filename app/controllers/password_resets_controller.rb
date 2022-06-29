class PasswordResetsController < ApplicationController
    def create
      @user = User.find_by(email: params[:email])
      if @user
        PasswordMailer.with(user: @user).reset.deliver_now
        redirect_to '/login', notice: 'We have sent a link to reset password. Check your email!'
      else
        redirect_to password_reset_path, alert: 'Your email address is not exist!'
      end
    end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/login', alert: 'Your token has expired. Please try again'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to '/login', notice: 'Your password was reset succesfully. Please sign in.'
    else
      render 'edit'
    end
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/login', alert: 'Your token has expired. Please try again'
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
