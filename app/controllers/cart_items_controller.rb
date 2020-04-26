class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end
  def create
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer.cart_items.build(cart_item_params)
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
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to :cart_items
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end
end
