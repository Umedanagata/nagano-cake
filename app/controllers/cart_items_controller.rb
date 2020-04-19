class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end
  def create
    @item = Item.find_by(params[:id])
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_item.item_id = @item.id
    @cart_item.save
    redirect_to :cart_items
  end
  def destroy_item
    @cart_item = current_customer.cart_items.where(customer_id: current_customer.id).destroy_all
    redirect_to :cart_items
  end
  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to :cart_items
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

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end
end
