class Admins::OrderItemsController < ApplicationController
  def update
  	@order = Order.find(params[:id])
       @order.update(order_items_params)
       @orderitems = @order.order_items.all
    if @order.orders_status == "deposit"
       @orderitems.each do |orderitem|
        orderitem.update(production_status: :waiting)
        redirect_back(fallback_location: root_path)
       end
    end
  end

   def order_items_params
    params.require(:order_item).permit( :production_status)
  end
end
