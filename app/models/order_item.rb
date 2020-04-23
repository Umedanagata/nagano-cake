class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

    enum production_status: {
		wait: 0,
	    deposit: 1,
	    production: 2,
	    preparation: 3,
	    sending: 4
	}
end
