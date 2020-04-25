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
       @orderitems = @order.order_items.all
    if @order.orders_status == "deposit"
       @orderitems.each do |order_item|
        order_item.update(production_status: :waiting)
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private

  def orders_params
    params.require(:order).permit(:orders_status)
  end

end
