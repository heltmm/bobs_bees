class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.honey if params[:category] === "honey"
    @products = Product.bee if params[:category] === "bee"
    @products = Product.hive if params[:category] === "hive"
    @products = Product.equipment if params[:category] === "equipment"
    @products = Product.bee_product if params[:category] === "bee_product"
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
