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

    order = current_order

    # If a user has NO orders OR NO 'in progress' and current_order is saved order we update current order to the user's account if current_order is not saved we save current order to the user's acout.
    if (!does_user_have_order?) || (!user_in_progress_order?)

      order_saved?(order) ? order.update(account_id: current_user.account.id) : Order.create(account_id: current_user.account.id)

      session[:order_id] = current_user.account.orders.last.id
    # If there are NO items in the current_order AND the user's account has an in progress order then make the 'in progress' order the current_order
    elsif (!items_in_order?) and (user_in_progress_order?)

      session[:order_id] = current_user.account.orders.last.id
      # We (ass)ume that there are items in the current_order AND the user has an order 'in progress'

    else
      order.order_items.each do |order_item|
        order_item.update(:order_id => current_user.orders.last.id)
      end
      Order.find(current_order.id).delete
      session[:order_id] = current_user.account.orders.last.id
    end
  end

  def after_sign_in_path_for(resource)
    attach_order
    products_path
  end

  def does_user_have_order?
    current_user.account.orders.any?
  end

  def user_in_progress_order?
    current_user.account.orders.last.status === "In progress"
  end

  def items_in_order?
    current_order.order_items.first
  end

  def order_saved?(order)
    order.id
  end


  # def after_sign_up_path_for(resource)
  #   current_user.account.create
  # end

end
