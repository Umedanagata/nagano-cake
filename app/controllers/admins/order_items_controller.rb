class Admins::OrderItemsController < ApplicationController
  def update
  	@orders =Order.all
  	@order_items =OrderItem.all
  end
end
