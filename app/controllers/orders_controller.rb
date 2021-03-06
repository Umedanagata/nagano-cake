class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.all
  end

  def new
    @order = current_customer.orders.new
    @address = current_customer.addresses.all
  end
  def show
    @order = Order.find(params[:id])
  end
  def confirm
    @order = current_customer.orders.new(order_params)
    amount #合計金額算出メソッド[amount]の呼び出し
    if params[:address_select] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.ship_name = current_customer.family_name + current_customer.last_name
    elsif params[:address_select] == "1"
      @address = current_customer.addresses.find(destination_params[:destination])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.ship_name = @address.ship_name
    elsif params[:address_select] == "2"
      @address = current_customer.addresses.new
      @address.postcode = @order.postcode
      @address.address = @order.address
      @address.ship_name = @order.ship_name
      @address.save
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    amount
    @cart_items = current_customer.cart_items.all
    if  @order.save
        @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          @order_items.name = cart_item.item.name
          @order_items.price = cart_item.item.price
          @order_items.quantity = cart_item.quantity
          @order_items.save
        end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      @address = current_customer.addresses.all
      render :new
    end
  end


  def complete
  end

  private
  def destination_params
    params.require(:order).permit(:destination)
  end
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :ship_name)
  end
  def order_items_params
    params.require(:order_items).permit(:order_id)
  end
  def amount
    order_amount = 0
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      price = (cart_item.item.price * 1.1).floor
      amount = cart_item.quantity * price
      order_amount += amount
    end
    @order.amount = order_amount + @order.postage
  end

  end
