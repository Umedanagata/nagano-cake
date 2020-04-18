class Item < ApplicationRecord
	has_many :genres
	has_many :order_items
end
