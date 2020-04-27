module ItemsHelper
  def item_price(item)
    tax_price = (item.price * 1.1).floor
  end
end
