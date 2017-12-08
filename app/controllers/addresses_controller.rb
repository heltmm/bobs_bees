class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    if user = current_user
      @address[:account_id] = user.account.id
    end
    if @address.save
      flash[:notice] = "Address successfully submitted!"
      current_order.update(:address_id => params[:address_id])
      redirect_to new_charge_path
    else
      if user = current_user
        user_account = user.account
        @current_order = current_order
        @user_addresses = user_account.addresses if user_account.addresses.any?
      end
      @address = Address.new
      render "carts/selectaddress"
    end
  end

private
  def address_params
    params.require(:address).permit(:full_name, :street1, :street2, :city, :state, :zipcode)
  end
end
