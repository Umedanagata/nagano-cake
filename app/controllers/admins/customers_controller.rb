class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @orders = Order.all
    @order_items = OrderItem.all
  end

  def show
    @orders = Order.all
    @order_items = OrderItem.all
  end

  def edit
  	@orders = Order.all
    @order_items = OrderItem.all
  end

  def update

  end
end