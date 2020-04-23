class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items
	enum payment_method: {credit:1, bank:2}
	def destination
		[postcode, address, ship_name].join
	end

	validates :postcode, presence: true
	validates :address, presence: true
end
