class OrderItemsController < ApplicationController
  def create
    order = current_order
    if is_in_cart = order.order_items.where("product_id = #{item_params[:product_id]}").first
      is_in_cart.update(:quantity => is_in_cart.quantity + item_params[:quantity].to_i)
    elsif
      @item = order.order_items.new(item_params)
    end
    if order.save
      session[:order_id] = order.id
      flash[:notice] = "Product Added to Cart"
      redirect_to cart_path
    else
      @product = Product.find(item_params[:product_id])
      @order_item = current_order.order_items.new
      @reviews = []
      render :template => "products/show"
    end

  end

  def update

    order = current_order
    @item = order.order_items.find(params[:id])
    @item.update(:quantity => params.require(:quantity))

    if order.save
      session[:order_id] = order.id
      flash[:notice] = "Quantity Updated"
      redirect_to cart_path
    end
  end

  def destroy
   order = current_order
   @item = order.order_items.find(params[:id])
   @item.destroy
   order.save
   redirect_to cart_path
 end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
