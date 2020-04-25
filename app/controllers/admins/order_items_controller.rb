class Admins::OrderItemsController < ApplicationController
  def update
  	   @order = Order.find(params[:id])
       @order_item = OrderItem.find(params[:abc])
       @order_item.update(order_items_params)
       @orderitems = @order.order_items


    if @orderitems.find_by(production_status: "creating")
       # ここのproductionは[製作中：production] のこと↓
       @order.update(orders_status: :production)
       redirect_back(fallback_location: root_path)
    elsif
      @orderitems.each do |order_item|
         # doneの数をカウントする
        done_count = order_item.where(production_status: "done").count
         # doneの数 = 1回の注文のitem数(order.item.name)なら
        done_count == order_item.name.count
        # orders_statusを”preparation”に変更
         @order.order_items.update(orders_status: :preparation)
        redirect_back(fallback_location: root_path)
      end
    else
       @order.update(order_items_params)
       redirect_back(fallback_location: root_path)
    end
  end

   def order_items_params
    params.require(:order_item).permit(:production_status)
  end
end
