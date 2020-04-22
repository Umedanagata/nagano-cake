class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @orders = Order.all
    @order_items = OrderItem.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@orders = Order.all
    @order_items = OrderItem.all
  end

  def update

  end
end