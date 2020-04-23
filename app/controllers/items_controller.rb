class ItemsController < ApplicationController
  before_action :set_genres, only:[:top, :index, :show, :genre_items]

  def top
    order_items = OrderItem.order(quantity: :DESC)
    @items = Item.find(OrderItem.group(:item_id).order('sum(quantity) desc').
    limit(4).pluck(:item_id))
  end

  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  def genre_items
    @genre = Genre.find(params[:id])
    @items = @genre.items.all
  end

  private
  def  set_genres
    @genres = Genre.all
  end
end
