class AddressesController < ApplicationController
  def create
    @user = User.find(params[:users_is])
    @address = @user.addresses.create(address_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:users_id])
    @address = @user.addresses.find(params[:id])
    @address.destroy
    redirect_to user_path(@user), status: 303
  end

  def user_addresses
    @addresses = Address.where(users_id: params[:user_id])
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :address, :zip, :city, :country)
  end
end