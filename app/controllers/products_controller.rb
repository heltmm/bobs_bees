class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end



  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
