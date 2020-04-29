class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  layout 'top'

  def update
  	   @order = Order.find(params[:id])
       @order_item = OrderItem.find(params[:abc])
       @order_item.update(order_items_params)
       @orderitems = @order.order_items


    if @orderitems.find_by(production_status: "creating")
       # ここのproductionは[製作中：production] ↓
       @order.update(orders_status: :production)
       redirect_to admins_order_path(@order.id)

       # doneの数をカウントする
    elsif a = 0
       @orderitems.each do |order_item|
        if order_item.production_status == "done"
          a += 1
        end
      end
      # doneの数 = 1回の注文のitem数(order.item.name)なら
      if a == @orderitems.count
        @order.update(orders_status: :preparation)
        redirect_to admins_order_path(@order.id)
      end
    end
  end

   def order_items_params
    params.require(:order_item).permit(:production_status)
  end
end
