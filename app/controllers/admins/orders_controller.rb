class Admins::OrdersController < ApplicationController
  def index
  	@orders =Order.page(params[:page]).per(10)
  	@order_items =OrderItem.all
    @customers = Customer.all
  end

  def show
  	@order =Order.all
  	@order_items =OrderItem.all
  end

  def update
  	@order =Order.all
  	@order_items =OrderItem.all
  end
end
