class OrderItemsController < ApplicationController
  def create
    order = current_order

    order.update_order(item_params)

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
      respond_to do |format|
        format.html {redirect_to cart_path}
        format.js { render "carts/destroy" }
      end
    end

  end

  def destroy
    order = current_order
    @item = order.order_items.find(params[:id])
    @item.destroy
    if order.save
      flash[:notice] = nil
      flash[:alert] = "Product removed!"
      @total = current_order.total_price
      respond_to do |format|
        format.html {redirect_to cart_path}
        format.js { render "carts/destroy" }
      end
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
