class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    if @order.save
      session[:order_id] = @order.id
      flash[:notice] = "Product Added to Cart"
      redirect_to cart_path
    else
      @product = Product.find(item_params[:product_id])
      @order_item = current_order.order_items.new
      render :template => "products/show"
    end

  end

  def destroy
   @order = current_order
   @item = @order.order_items.find(params[:id])
   @item.destroy
   @order.save
   redirect_to cart_path
 end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
