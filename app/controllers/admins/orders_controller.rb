class Admins::OrdersController < ApplicationController
   Time.zone = 'Tokyo'

  def index
  	@orders = Order.page(params[:page]).per(3)
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params.id)
    @order.customer_id = customer_id
  # 注文id＝＝注文商品の持つ商品id
    @order.id = @order.order_items.id
  end
end
