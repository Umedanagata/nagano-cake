class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items
	enum payment_method: {credit:1, bank:2}

	enum production_status: {
		wait: 0,
	    deposit: 1,
	    production: 2,
	    preparation: 3,
	    sending: 4
	}

	def destination
		[postcode, address, ship_name].join
	end

end
