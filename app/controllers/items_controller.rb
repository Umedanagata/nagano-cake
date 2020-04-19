class ItemsController < ApplicationController

  def top
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_customer.cart_items.build
  end

end
