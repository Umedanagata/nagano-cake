class Address < ApplicationRecord
  belongs_to :customer
  def destination
		[postcode, address, ship_name].join
	end

  end
