module ItemsHelper
  def item_price(item)
    tax_price = (item.price * 1.1).floor.to_s(:delimited)
  end
end
