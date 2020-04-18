class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  def create

  end
  def destroy_item

  end
  def destroy

  end
  def update

  end
  def amount(cart_items)
    cart_items.each do |cart_item|
      amount = cart_item.quantity * cart_item.price
      amount += quantity
    end
    return amount
  end

  helper_method :amount
end
