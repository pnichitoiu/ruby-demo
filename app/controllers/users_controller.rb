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

    if @user.save
      flash[:notice] = "User created."
      redirect_to @user
    else
      render "new"
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

  private
  def user_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :phone_number)
  end
end