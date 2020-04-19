class Item < ApplicationRecord
	belongs_to :genre , optional: true
	has_many :order_items
	has_many :cart_items , dependent: :destroy
	has_many :customers, through: :cart_items
	attachment :image
end
