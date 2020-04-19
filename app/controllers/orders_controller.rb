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
    if params[:address_select] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.ship_name = current_customer.family_name + current_customer.last_name
    elsif params[:address_select] == "2"
      @order.postcode = params[:postcode]
      @order.address = params[:address]
      @order.ship_name = params[:ship_name]
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
  # def address_select(order_params)
  #   if address_select == 0
  #     @order.address == current_customer.addresses
  #   elsif address_select == 2
  #     @order.address == current_customer.addresses.new(order_params)
  #   end
  # end
end
