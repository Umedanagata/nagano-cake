class Admins::TopController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@order = Order.where(created_at: "today")
  end
end
