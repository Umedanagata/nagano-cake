class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

    enum production_status: {
		cannot: 0,
		waiting: 1,
	    creating: 2,
	    done: 3

	}
end
