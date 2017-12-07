class AddressesController < ApplicationController
  def create
    if current_user
      @address = current_user.account.address.new(address_params)
    else
      @address = current_order.address.new(address_params)
    end
    if @address.save
      flash[:notice] = "Address successfully submitted!"
      redirect_to cart_checkout_path()
    else
      render "carts/checkout"
    end
  end

private
  def address_params
    params.require(:address).permit(:full_name, :street1, :street2, :city, :state, :zipcode)
  end
end
