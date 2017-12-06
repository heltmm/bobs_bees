class Order < ApplicationRecord
  belongs_to :account, optional: true
  has_many :order_items

  before_save :update_total
  before_create :update_status

  def update_order(item_params)
    @item_params = item_params
    same_item = is_in_cart
    same_item ? update_quantity(same_item) : new_item
  end

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

private
  def update_status
    if self.status === nil
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end

  def is_in_cart
    self.order_items.where("product_id = #{@item_params[:product_id]}").first
  end

  def update_quantity(same_item)
    same_item.update(:quantity => same_item.quantity + @item_params[:quantity].to_i)
  end

  def new_item
    self.order_items.new(@item_params)
  end
end
