class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
     @user = User.find(params[:id])
     @address = Address.where(users_id: params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        ConfirmationMailer.with(user: @user).user_created.deliver_now
        format.html { redirect_to login_path, notice: 'User created.' }
      else
        format.html { redirect_to signup_path, alert: @user.errors }
      end
    end
  end

  def edit
    if logged_in?
      # check if an user is logged in
      @user = User.find(params[:id])
    else
      #redirect to login page
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  def forgot_password
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user
        format.html { redirect_to forgot_password_path, notice: "Check you email!"}
      else
        format.html { redirect_to forgot_password_path, alert: "Your email is incorrect!" }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :phone_number, :password_confirmation)
  end
end