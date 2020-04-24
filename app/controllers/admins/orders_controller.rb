class Admins::OrdersController < ApplicationController
   Time.zone = 'Tokyo'

  def index
  	@orders = Order.page(params[:page]).per(3)
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
      # 注文id＝＝注文商品の持つ商品id
    @order = Order.find(params[:id])
    @order.update(orders_params)
    if @order == :deposit
     @product_status = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_items = @order.order_items.new
      @order_items.item_id = cart_item.item.id
      @order_items.name = cart_item.item.name
      @order_items.price = cart_item.item.price
      @order_items.quantity = cart_item.quantity
      product_status.update
    end
    else
      redirect_to :show
    end

  private

  def orders_params
    params.require(:order).permit(:orders_status)
  end

end
