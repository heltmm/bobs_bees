class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }

  # def update_order
  #   same_item = is_in_cart ? update_quantity(same_item) : new_item
  # end
  scope :most_recent, -> { order(created_at: :desc)}
  
private
  # def is_in_cart
  #   order.order_items.where("product_id = #{item_params[:product_id]}").first
  # end
  #
  # def update_quantity
  #   same_item.update(:quantity => same_item.quantity + item_params[:quantity].to_i)
  # end
  #
  # def new_item
  #   order.order_items.new(item_params)
  # end
end
