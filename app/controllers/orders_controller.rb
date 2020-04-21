class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all
  end

  def new
    @order = current_customer.orders.new
    @address = current_customer.addresses.all
  end

  def show

  end

  def confirm
    @order = current_customer.orders.new
    @cart_item = current_customer.cart_items
    @cart_items = @cart_item.all
    if params[:address_select] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.ship_name = current_customer.family_name + current_customer.last_name
    elsif params[:address_select] == "1"
      @address = current_customer.addresses.find(order_params[:destination])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.ship_name = @address.ship_name
    elsif params[:address_select] == "2"
     @order = current_customer.orders.new(order_params)
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
    params.require(:order).permit(:destination, :payment_method, :postcode, :address, :ship_name)
  end
end
