class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items
	enum payment_method: {credit:1, bank:2}
    enum orders_status: {
         wait: 0,
	     deposit: 1,
	     production: 2,
	     preparation: 3,
	     sending: 4
	}

	def destination
		[postcode, address, ship_name].join
	end

	def total_quantity
		a = 0
        self.order_items.each do |o_i|
        	a += o_i.quantity
        end
        return a
	end

end
