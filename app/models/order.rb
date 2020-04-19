class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items
	enum payment_method: {credit:1, bank:2}
end
