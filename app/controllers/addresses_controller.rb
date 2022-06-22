class AddressesController < ApplicationController
  def create
    # @user = User.find(@current_user)
    @address = Address.new(address_params)
    @address.users_id = current_user.id
    respond_to do |format|
      if @address.save
        format.html { redirect_to user_path(current_user.id), notice: 'Address added.' }
      else
        format.html { redirect_to user_path(current_user.id), alert: @address.errors }
      end
    end
  end

  def new
    @user = User.find(current_user.id)
    @address = @user.addresses.build
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to user_path(@address.users_id), status: 303
  end

  def user_addresses
    @addresses = Address.where(users_id: params[:user_id])
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :street, :zip, :city, :country)
  end
end