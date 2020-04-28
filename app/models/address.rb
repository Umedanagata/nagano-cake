class Address < ApplicationRecord
  belongs_to :customer
  def destination
		[postcode, address, ship_name].join
	end

  with_options presence: true do
    validates :postcode
    validates :address
    validates :ship_name
  end

  end
