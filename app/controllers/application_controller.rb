class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def attach_order
    binding.pry
    # If a user has NO orders the pass off the current to the user's account
    if !current_user.account.orders.any?
      current_order.update(account_id: current_user.account.id)
    # If there are NO items in the current order AND the user's account has an in progress order then make it the current_order
    elsif (!current_order.order_items.first) and (current_user.account.orders.last.status === "In progress")
      binding.pry
      session[:order_id] = current_user.account.orders.last.id
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
