module CartItemsHelper
  def cart_item_price(cart_item)
    tax_price = (cart_item.item.price * 1.1).floor.to_s(:delimited)
  end
end
