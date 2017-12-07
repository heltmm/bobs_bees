class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.most_recent

  end

  def checkout
    @address = Address.new
  end
end
