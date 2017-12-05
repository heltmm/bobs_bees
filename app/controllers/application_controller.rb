class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      guest = Account.create
      guest.orders.new
    end
  end

  def attach_order
    if current_user # and current_order
      current_order.update(account_id: 1)
    end
  end

  def after_sign_in_path_for(resource)
    attach_order
    products_path
  end

  # def after_sign_up_path_for(resource)
  #   binding.pry
  #   current_user.account.create
  # end

end
