class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.most_recent

  end

  def selectaddress
    if user = current_user
      user_account = user.account
      @current_order = current_order
      @user_addresses = user_account.addresses if user_account.addresses.any?
    end
    @address = Address.new
  end

  def processaddress
    current_order.update(:address_id => params[:address_id])
    redirect_to new_charge_path
  end
end
