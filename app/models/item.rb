class Item < ApplicationRecord
	belongs_to :genres
	has_many :order_items
	has_many :cart_items , dependent: :destroy
end
