class Admins::OrderItemsController < ApplicationController
  def update
  	@orderitem = OrderItem.find(params[:id])
    @orderitem.update(orders_params)
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
    elsif

    else
      redirect_to :show
    end
  end

  def production_params
    params.require(:order_item).permit(:production_status)
  end
end
