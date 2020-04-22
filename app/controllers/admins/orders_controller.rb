class Admins::OrdersController < ApplicationController
   Time.zone = 'Tokyo'

  def index
  	@orders =Order.page(params[:page]).per(3)
  end

  def show
  	@order = Order.all
  end
  # @customer = Customer.find(@order.customer_id)
  def update
    @order = Order.find(customer.id)
  # 注文id＝＝注文商品の持つ商品id
    @order.id = @order.order_items.id
  end
end
