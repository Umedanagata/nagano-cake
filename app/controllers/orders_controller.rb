class OrdersController < ApplicationController
  def index
  end
  def new
    @order = current_customer.orders.new
    @address = current_customer.addresses.build
  end
  def show

  end
  def confirm
    @order = current_customer.orders.new(order_params)
    @cart_item = current_customer.cart_items
    @cart_items = @cart_item.all
  end

  def create
    @order = current_customer.orders.new
    @order.save
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end
  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :ship_name)
  end
end
