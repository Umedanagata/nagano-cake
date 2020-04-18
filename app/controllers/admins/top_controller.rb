class Admins::TopController < ApplicationController
  def top
  	@order = Order.all
  end
end
