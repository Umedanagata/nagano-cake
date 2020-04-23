class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all
  end

  def new
    @order = current_customer.orders.new
    @address = current_customer.addresses
  end

  def show
    @orders = Order.find(params[:id])
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @cart_item = current_customer.cart_items
    @cart_items = @cart_item.all
    if params[:address_select] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.ship_name = current_customer.family_name + current_customer.last_name
    end
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
