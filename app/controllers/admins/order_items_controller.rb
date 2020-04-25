class Admins::OrderItemsController < ApplicationController
  def update
  	   @order = Order.find(params[:id])
       @order.order_items.update(order_items_params)
       # 複数？
    if @order.order_items.production_status == "creating"
       @order.order_items.(orders_status: :production)
       redirect_back(fallback_location: root_path)
       end
    elsif
    	# 複数？
       @order_items.production_status == "done"
       @order.order_items.update(orders_status: :preparation)
        redirect_back(fallback_location: root_path)
       end
    end
  end

   def order_items_params
    params.require(:order_item).permit(:production_status)
  end
end
