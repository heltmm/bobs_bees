class ProductsController < ApplicationController
  def index
    @products = Product.all
    @reviews = Review.group('product_id').average('rating')
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    @reviews = @product.reviews
  end

  def home
    
  end



  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
