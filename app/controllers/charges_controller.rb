class ChargesController < ApplicationController
  def new
    @amount = current_order.total_price
  end

  def create
    # Amount in cents
    @amount = current_order.total_price
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount * 100).to_i,
      :description => 'Bob\'s Bees LLC',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end
end