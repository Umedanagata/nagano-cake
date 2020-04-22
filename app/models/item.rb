class Item < ApplicationRecord
	belongs_to :genre
	has_many :order_items
	has_many :cart_items , dependent: :destroy
	has_many :customers, through: :cart_items
	attachment :image

	validates :image , presence: true
	validates :name , presence: true
	validates :text , length: { minimum: 20 }
	validates :price , presence: true
	validates :is_sale, inclusion: { in: [true, false] }
end
